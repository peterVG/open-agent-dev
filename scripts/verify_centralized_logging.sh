#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
#
# Reject staged source files that write logs to disk instead of stdout.
#
# Each supported stack is checked with its own patterns, matched against the
# staged (index) content of files with that stack's extensions, so an unstaged
# working-tree edit cannot hide a violation that is still in the commit:
#   - Elixir (.ex, .exs): LoggerFileBackend, or a "*.log" path literal.
#   - Python (.py): FileHandler and the rotating/watched file handlers, whether
#     called as logging.FileHandler(...) or imported and called bare.
#   - JavaScript/TypeScript (.js, .mjs, .cjs, .ts, .mts, .cts, .jsx, .tsx):
#     createWriteStream( on a line that names a file ending in ".log".
#   - Rust (.rs): tracing_appender::rolling file appenders.
# Paths containing whitespace are handled (NUL-delimited file list).

set -e

echo "Starting Centralized Logging Validation..."

FAILED=0

log_pattern_for() {
  # $1 = file path. Prints the extended regex of file-logging patterns for the
  # file's stack, or nothing when the stack is not checked. Pure lookup.
  case "$1" in
    *.ex|*.exs) echo 'LoggerFileBackend|\.log"' ;;
    *.py) echo '\b(Rotating|TimedRotating|Watched)?FileHandler\(' ;;
    *.js|*.mjs|*.cjs|*.ts|*.mts|*.cts|*.jsx|*.tsx) echo 'createWriteStream\(.*\.log['"'"'"`]' ;;
    *.rs) echo 'tracing_appender::rolling' ;;
  esac
}

staged_file_matches() {
  # $1 = staged path, $2 = extended regex. True when the staged (index) copy
  # of the file contains the pattern. Reads from the git index.
  git show ":$1" 2>/dev/null | grep -qiE "$2"
}

check_staged_file() {
  # $1 = staged path. Sets FAILED=1 when its staged content logs to a file.
  local file="$1" pattern
  pattern=$(log_pattern_for "$file")
  [ -n "$pattern" ] || return 0
  staged_file_matches "$file" "$pattern" || return 0
  echo "❌ ERROR: File logging destination detected in $file!"
  FAILED=1
}

while IFS= read -r -d '' FILE; do
  check_staged_file "$FILE"
done < <(git diff --cached --name-only -z --diff-filter=ACMR)

if [ "$FAILED" -ne 0 ]; then
  echo ""
  echo "🚨 VALIDATION FAILED: Centralized Logging rule violated."
  echo "Applications MUST NEVER store their own log files on disk. You must use 'stdout' only for centralized log streams."
  exit 1
fi

echo "✅ Centralized Logging validation passed."
exit 0
