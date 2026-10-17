#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
#
# Fail when a language or dependency manifest sits at the repository root instead of under apps/.

set -e

echo "Starting Workspace Boundary Validation..."

# Common language and dependency manifests, not an exhaustive list. Add any
# other manifest your stack uses at its root to keep it out of the repo root.
FORBIDDEN_FILES=(
  "mix.exs"
  "package.json"
  "requirements.txt"
  "pyproject.toml"
  "setup.py"
  "Pipfile"
  "Cargo.toml"
  "rust-toolchain.toml"
  "go.mod"
  "pom.xml"
  "build.gradle"
  "build.gradle.kts"
  "composer.json"
  "Gemfile"
)

FAILED=0

for FILE in "${FORBIDDEN_FILES[@]}"; do
  if [ -f "$FILE" ]; then
    echo "❌ ERROR: Forbidden language tooling '$FILE' found at global repository root!"
    FAILED=1
  fi
done

if [ "$FAILED" -ne 0 ]; then
  echo ""
  echo "🚨 VALIDATION FAILED: Workspace Boundaries rule violated."
  echo "All language and dependency manifests MUST be placed inside individual modules in the 'apps/' directory, not at the root!"
  exit 1
fi

echo "✅ Workspace Boundary validation passed."
exit 0
