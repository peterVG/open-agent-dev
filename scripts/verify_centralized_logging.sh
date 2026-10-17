#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
#
# Reject staged source files that write logs to disk instead of stdout.
#
# Each supported stack is checked with its own patterns, matched against the
# staged files with that stack's extensions:
#   - Elixir (.ex, .exs): LoggerFileBackend, or a "*.log" path literal.
#   - Python (.py): logging.FileHandler and the rotating file handlers.
#   - JavaScript/TypeScript (.js, .mjs, .cjs, .ts, .mts, .cts, .jsx, .tsx):
#     fs.createWriteStream( on a line that names a .log file.
#   - Rust (.rs): tracing_appender::rolling file appenders.

set -e

echo "Starting Centralized Logging Validation..."

STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACMR)

if [ -z "$STAGED_FILES" ]; then
  exit 0
fi

FAILED=0

log_pattern_for() {
  # $1 = file path. Prints the extended regex of file-logging patterns for the
  # file's stack, or nothing when the stack is not checked. Pure lookup.
  case "$1" in
    *.ex|*.exs) echo 'LoggerFileBackend|\.log"' ;;
    *.py) echo 'logging\.FileHandler|(logging\.handlers\.)?(Rotating|TimedRotating|Watched)FileHandler' ;;
    *.js|*.mjs|*.cjs|*.ts|*.mts|*.cts|*.jsx|*.tsx) echo 'createWriteStream\(.*\.log' ;;
    *.rs) echo 'tracing_appender::rolling' ;;
  esac
}

for FILE in $STAGED_FILES; do
  [ -f "$FILE" ] || continue
  PATTERN=$(log_pattern_for "$FILE")
  [ -n "$PATTERN" ] || continue
  if grep -qiE "$PATTERN" "$FILE"; then
    echo "❌ ERROR: File logging destination detected in $FILE!"
    FAILED=1
  fi
done

if [ "$FAILED" -ne 0 ]; then
  echo ""
  echo "🚨 VALIDATION FAILED: Centralized Logging rule violated."
  echo "Applications MUST NEVER store their own log files on disk. You must use 'stdout' only for centralized log streams."
  exit 1
fi

echo "✅ Centralized Logging validation passed."
exit 0
