#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
#
# Require a Markdown documentation change whenever staged application code changes.
# Any staged file under apps/ that is not Markdown counts as code, whatever the stack.

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting Document Sync Validation..."

# Get all staged files
STAGED_FILES=$(git diff --cached --name-only)

if [ -z "$STAGED_FILES" ]; then
  # Nothing staged
  exit 0
fi

# Check if any application code (a non-Markdown file under apps/) was modified
CODE_MODIFIED=0
for FILE in $STAGED_FILES; do
  if [[ "$FILE" == apps/* ]] && [[ "$FILE" != *.md ]]; then
    CODE_MODIFIED=1
    break
  fi
done

# Check if any documentation was modified
DOCS_MODIFIED=0
for FILE in $STAGED_FILES; do
  if [[ "$FILE" == *.md ]]; then
    DOCS_MODIFIED=1
    break
  fi
done

if [ "$CODE_MODIFIED" -eq 1 ] && [ "$DOCS_MODIFIED" -eq 0 ]; then
  echo ""
  echo "🚨 VALIDATION FAILED: Code was modified but no documentation (.md files) were updated!"
  echo "Per the Pull Request Documentation Updates rule, permanent documentation (PRD, SRS, ADRs) must remain synchronized."
  echo "Update the affected PRD, SRS, ADR or README in the same commit. Do not bypass this hook with 'git commit --no-verify'"
  echo "(.agents/rules/local-verification.md); if no documentation applies, ask the repository owner how to proceed."
  echo ""
  exit 1
fi

echo "✅ Document Sync Validation passed."
exit 0
