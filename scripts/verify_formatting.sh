#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
#
# Format validation: check Rust, npm, Elixir, and Python formatting under apps/ without changing files.
#
# Checks formatting for every stack present under apps/ without changing files:
#   - Rust: `cargo fmt --all --check` in each product-local Cargo workspace
#     (a directory under apps/ that holds a Cargo.toml).
#   - TypeScript: `prettier --check .` in each npm package (a directory under
#     apps/ or apps/*/ that holds a package.json). Requires `npm ci` to have
#     been run in that package; the check fails with that instruction otherwise.
#   - Elixir: `mix format --check-formatted` in each app with a mix.exs.
#   - Python: `ruff format --check .` and `ruff check .` in each app with a
#     pyproject.toml or requirements.txt. Uses the app's .venv ruff when present,
#     else ruff on PATH; fails with an install hint when neither exists.
#
# Usage: ./scripts/verify_formatting.sh   (from the repository root)

echo "Starting Format Validation..."

APPS_DIR="./apps"
FAILED=0

check_rust_workspace() {
  # $1 = workspace directory holding Cargo.toml
  local dir="$1"
  echo "🔍 Validating Rust formatting in $dir..."
  if (cd "$dir" && cargo fmt --all --check >/dev/null 2>&1); then
    echo "✅ $dir is properly formatted."
  else
    echo "❌ ERROR ($dir): Rust format violation. Run 'cargo fmt --all' in $dir."
    FAILED=1
  fi
}

check_npm_package() {
  # $1 = package directory holding package.json
  local dir="$1"
  echo "🔍 Validating Prettier formatting in $dir..."
  if [ ! -d "$dir/node_modules" ]; then
    echo "❌ ERROR ($dir): node_modules missing. Run 'npm ci' in $dir first."
    FAILED=1
    return
  fi
  if (cd "$dir" && npx prettier --check . >/dev/null 2>&1); then
    echo "✅ $dir is properly formatted."
  else
    echo "❌ ERROR ($dir): Prettier format violation. Run 'npx prettier --write .' in $dir."
    FAILED=1
  fi
}

check_elixir_app() {
  # $1 = app directory holding mix.exs
  local dir="$1"
  echo "🔍 Validating Elixir formatting in $dir..."
  if (cd "$dir" && mix format --check-formatted >/dev/null 2>&1); then
    echo "✅ $dir is properly formatted."
  else
    echo "❌ ERROR ($dir): Elixir format violation. Run 'mix format' in $dir."
    FAILED=1
  fi
}

is_python_app() {
  # $1 = app directory. True when it holds a Python project manifest.
  [ -f "$1/pyproject.toml" ] || [ -f "$1/requirements.txt" ]
}

find_python_tool() {
  # $1 = app directory, $2 = tool name. Prints the absolute path of the app's
  # virtualenv copy of the tool (.venv/bin or, on Windows, .venv/Scripts), else
  # the tool on PATH, else nothing. Pure lookup.
  local dir="$1" tool="$2" candidate
  for candidate in "$dir/.venv/bin/$tool" "$dir/.venv/Scripts/$tool.exe"; do
    [ -x "$candidate" ] && { echo "$(cd "$(dirname "$candidate")" && pwd)/$(basename "$candidate")"; return; }
  done
  command -v "$tool" 2>/dev/null || true
}

check_python_app() {
  # $1 = app directory holding pyproject.toml or requirements.txt
  local dir="$1" ruff
  echo "🔍 Validating Python formatting and lint in $dir..."
  ruff=$(find_python_tool "$dir" ruff)
  if [ -z "$ruff" ]; then
    echo "❌ ERROR ($dir): ruff not found in $dir/.venv or on PATH. Install it (for example 'pip install ruff' in the app's virtualenv) first."
    FAILED=1
    return
  fi
  if (cd "$dir" && "$ruff" format --check . >/dev/null 2>&1 && "$ruff" check . >/dev/null 2>&1); then
    echo "✅ $dir is properly formatted."
  else
    echo "❌ ERROR ($dir): Python format or lint violation. Run 'ruff format .' and 'ruff check .' in $dir."
    FAILED=1
  fi
}

for APP_PATH in "$APPS_DIR"/*; do
  [ -d "$APP_PATH" ] || continue
  [ -f "$APP_PATH/Cargo.toml" ] && check_rust_workspace "$APP_PATH"
  [ -f "$APP_PATH/package.json" ] && check_npm_package "$APP_PATH"
  [ -f "$APP_PATH/mix.exs" ] && check_elixir_app "$APP_PATH"
  is_python_app "$APP_PATH" && check_python_app "$APP_PATH"
  for SUB_PATH in "$APP_PATH"/*; do
    [ -d "$SUB_PATH" ] && [ -f "$SUB_PATH/package.json" ] && check_npm_package "$SUB_PATH"
  done
done

if [ "$FAILED" -ne 0 ]; then
  echo ""
  echo "🚨 VALIDATION FAILED: Test-Driven Development formatting rule violated."
  echo "Format each listed workspace before committing."
  exit 1
fi

echo "✅ Format validation passed."
exit 0
