#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
#
# Ensure each Elixir app under apps/ binds a unique port that matches between dev.exs and runtime.exs.
#
# Only Elixir/Phoenix apps (a directory under apps/ holding config/dev.exs and
# config/runtime.exs) are checked. Apps on other stacks (Python, JavaScript,
# Rust, ...) are skipped with a message; keep their dev ports unique by hand as
# described in .agents/rules/workspace-boundaries.md.

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting Port Isolation Validation (Elixir apps)..."

APPS_DIR="./apps"
ALL_PORTS_STRING=" "
FAILED=0

# Loop through each app in the apps directory
for APP_PATH in "$APPS_DIR"/*; do
  [ -d "$APP_PATH" ] || continue
  APP_NAME=$(basename "$APP_PATH")

  DEV_EXS="$APP_PATH/config/dev.exs"
  RUNTIME_EXS="$APP_PATH/config/runtime.exs"

  # 1. Only Elixir apps with both config files are checked
  if [ ! -f "$DEV_EXS" ] || [ ! -f "$RUNTIME_EXS" ]; then
    echo "ℹ️  [SKIPPING] $APP_NAME: no config/dev.exs and config/runtime.exs (not an Elixir app, or not a web endpoint)."
    continue
  fi

  echo "🔍 Validating $APP_NAME..."

  # Extract target dev port using regex search
  # Matches: port: 4000
  DEV_PORT=$(grep -oE 'port:[[:space:]]*[0-9]+' "$DEV_EXS" | grep -oE '[0-9]+' | head -n 1 || true)

  # Extract target fallback runtime port using regex search
  # Matches: System.get_env("PORT", "4000")
  RUNTIME_PORT=$(grep -oE 'System\.get_env\("PORT",[[:space:]]*"[0-9]+"\)' "$RUNTIME_EXS" | grep -oE '[0-9]+' | head -n 1 || true)

  if [ -z "$DEV_PORT" ]; then
    echo "❌ ERROR ($APP_NAME): Could not find 'port: XXXX' in dev.exs"
    FAILED=1
    continue
  fi

  if [ -z "$RUNTIME_PORT" ]; then
    echo "❌ ERROR ($APP_NAME): Could not find fallback 'PORT', 'XXXX' in runtime.exs"
    FAILED=1
  fi

  # 2. Assert Match
  if [ -n "$RUNTIME_PORT" ] && [ "$DEV_PORT" != "$RUNTIME_PORT" ]; then
    echo "❌ ERROR ($APP_NAME): Port mismatch! dev.exs ($DEV_PORT) != runtime.exs ($RUNTIME_PORT)"
    FAILED=1
  fi

  # 3. Assert Uniqueness (exact match on " <port>:" so 400 does not match 4000)
  if [[ "$ALL_PORTS_STRING" == *" $DEV_PORT:"* ]]; then
    echo "❌ ERROR ($APP_NAME): Port $DEV_PORT is already in use by another app!"
    FAILED=1
    continue
  fi
  ALL_PORTS_STRING="$ALL_PORTS_STRING$DEV_PORT:$APP_NAME "
  echo "✅ $APP_NAME uniquely bound to $DEV_PORT"
done

if [ "$FAILED" -ne 0 ]; then
  echo ""
  echo "🚨 VALIDATION FAILED: Port isolation constraints violated. See errors above."
  exit 1
fi

echo ""
echo "🚀 VALIDATION PASSED: All checked Elixir apps maintain strict port isolation."
exit 0
