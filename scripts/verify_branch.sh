#!/usr/bin/env bash

# Prevent direct commits to main/master to enforce the Branch-Per-Task workflow.

BRANCH_NAME=$(git branch --show-current)

if [ "$BRANCH_NAME" = "main" ] || [ "$BRANCH_NAME" = "master" ]; then
  if [ "$FORCE_MAIN_COMMIT" = "1" ]; then
    echo "⚠️  WARNING: Direct commit to '$BRANCH_NAME' forced by human override."
    exit 0
  fi
  echo "❌ Branch Validation Failed: You are attempting to commit directly to the '$BRANCH_NAME' branch."
  echo "   Please adhere to the Branch-per-Task workflow. Create a feature branch (e.g., 'git checkout -b feature/name') to commit these changes."
  echo "   (Human override: prefix your command with FORCE_MAIN_COMMIT=1)"
  exit 1
fi

echo "✅ Branch Validation passed."
exit 0
