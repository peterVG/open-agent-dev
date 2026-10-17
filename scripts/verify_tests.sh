#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
#
# Lint and test validation: run clippy, cargo test, npm, mix test, and pytest gates for every stack under apps/.
#
# This repository has no hosted CI; these are the gates that would otherwise
# run there. Like verify_formatting.sh, it discovers every stack present under
# apps/ rather than naming products, so it works unchanged in any repository
# that follows the apps/<product>/ layout:
#   - Rust (a directory under apps/ holding a Cargo.toml):
#       1. cargo clippy --workspace --all-targets --locked -- -D warnings
#       2. cargo test --workspace --locked
#       3. cargo test -p <crate> --locked for each member crate alone, which
#          proves no crate silently depends on features its siblings enable
#       4. cargo doc --workspace --no-deps --locked with warnings denied
#   - npm (a directory under apps/ or apps/*/ holding a package.json):
#       5. npm run lint, npm run check, npm test (each only when the script is
#          defined in package.json)
#       6. npm run test:e2e, only when VERIFY_E2E=1 and the script is defined
#          (end-to-end runs usually build and start the app; slow)
#   - Elixir (a directory under apps/ holding a mix.exs):
#       7. mix test
#   - Python (a directory under apps/ holding a pyproject.toml or
#     requirements.txt):
#       8. pytest (skipped with a message when pytest is not on PATH; lint
#          runs in verify_formatting.sh via ruff)
#
# Environment:
#   VERIFY_SKIP_TESTS=1  skip this script (work-in-progress commits only;
#                        run it before pushing)
#   VERIFY_E2E=1         also run end-to-end tests in each npm package
#
# Usage: ./scripts/verify_tests.sh   (from the repository root)

echo "Starting Lint and Test Validation..."

if [ "$VERIFY_SKIP_TESTS" = "1" ]; then
  echo "⚠️  WARNING: VERIFY_SKIP_TESTS=1, lint and tests skipped. Run ./scripts/verify_tests.sh before pushing."
  exit 0
fi

APPS_DIR="./apps"
FAILED=0

run_step() {
  # $1 = label, $2 = directory, remaining = command. Streams output so a
  # failure shows its cause; records failure instead of exiting.
  local label="$1" dir="$2"; shift 2
  echo "🔍 $label ($dir)..."
  if (cd "$dir" && "$@"); then
    echo "✅ $label passed."
  else
    echo "❌ $label failed."
    FAILED=1
  fi
}

list_member_crates() {
  # $1 = Cargo workspace directory. Prints the package name of every crate
  # nested under it (up to two levels deep, build output excluded), one per
  # line. Pure lookup: reads Cargo.toml files only.
  find "$1" -mindepth 2 -maxdepth 3 -name Cargo.toml -not -path "*/target/*" -not -path "*/node_modules/*" \
    | sort \
    | xargs -n 1 sed -n '/^\[package\]/,/^\[/{s/^name *= *"\(.*\)"/\1/p;}'
}

has_npm_script() {
  # $1 = package directory, $2 = script name. True when package.json defines it.
  grep -q "\"$2\"[[:space:]]*:" "$1/package.json"
}

run_rust_workspace() {
  # $1 = workspace directory holding Cargo.toml
  local dir="$1" crate
  run_step "Clippy" "$dir" cargo clippy --workspace --all-targets --locked -- -D warnings
  run_step "Workspace tests" "$dir" cargo test --workspace --locked
  for crate in $(list_member_crates "$dir"); do
    run_step "Member crate alone: $crate" "$dir" cargo test -p "$crate" --locked
  done
  run_step "Rustdoc" "$dir" env RUSTDOCFLAGS="-D warnings" cargo doc --workspace --no-deps --locked
}

run_npm_package() {
  # $1 = package directory holding package.json
  local dir="$1"
  if [ ! -d "$dir/node_modules" ]; then
    echo "❌ ERROR ($dir): node_modules missing. Run 'npm ci' in $dir first."
    FAILED=1
    return
  fi
  has_npm_script "$dir" lint && run_step "Lint" "$dir" npm run lint
  has_npm_script "$dir" check && run_step "Type check" "$dir" npm run check
  has_npm_script "$dir" test && run_step "Unit tests" "$dir" npm test
  if ! has_npm_script "$dir" test:e2e; then
    return
  fi
  if [ "$VERIFY_E2E" = "1" ]; then
    run_step "End-to-end tests" "$dir" npm run test:e2e
  else
    echo "ℹ️  End-to-end tests skipped for $dir (set VERIFY_E2E=1 to run)."
  fi
}

run_elixir_app() {
  # $1 = app directory holding mix.exs
  run_step "ExUnit" "$1" mix test
}

is_python_app() {
  # $1 = app directory. True when it holds a Python project manifest.
  [ -f "$1/pyproject.toml" ] || [ -f "$1/requirements.txt" ]
}

run_python_app() {
  # $1 = app directory holding pyproject.toml or requirements.txt
  if ! command -v pytest >/dev/null 2>&1; then
    echo "⚠️  [SKIPPING] $1: pytest is not installed. Install it to run Python tests."
    return
  fi
  run_step "Pytest" "$1" pytest
}

for APP_PATH in "$APPS_DIR"/*; do
  [ -d "$APP_PATH" ] || continue
  [ -f "$APP_PATH/Cargo.toml" ] && run_rust_workspace "$APP_PATH"
  [ -f "$APP_PATH/package.json" ] && run_npm_package "$APP_PATH"
  [ -f "$APP_PATH/mix.exs" ] && run_elixir_app "$APP_PATH"
  is_python_app "$APP_PATH" && run_python_app "$APP_PATH"
  for SUB_PATH in "$APP_PATH"/*; do
    [ -d "$SUB_PATH" ] && [ -f "$SUB_PATH/package.json" ] && run_npm_package "$SUB_PATH"
  done
done

if [ "$FAILED" -ne 0 ]; then
  echo ""
  echo "🚨 VALIDATION FAILED: fix the lint or test failures listed above before committing."
  exit 1
fi

echo "✅ Lint and test validation passed."
exit 0
