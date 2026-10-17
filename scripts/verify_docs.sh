#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
#
# Documentation validation: run the scripts/docs/ validators and the task-cleanup check.
#
# Runs the documentation validators under scripts/docs/ and the task-cleanup
# check. Each validator exits non-zero on failure and prints what is wrong,
# and each passes with nothing checked when the documents it covers do not
# exist yet, so a fresh repository is not blocked.
#   - validate-adrs.mjs: every ADR under resources/architecture/ADRs/ (root
#     and per app) is named ADR-NNN-slug.md, numbered consecutively, carries
#     the project header, the nine ISO 42010 sections, and a valid Status.
#   - check_prd_allocation.py: every requirement ID in a product vision is
#     allocated in the matching PRD's "## Vision allocation" table.
#   - check_links.py: every relative Markdown link and anchor resolves.
#   - check_workspace_links.py: no link crosses the boundary of a standalone
#     workspace listed in STANDALONE_WORKSPACES below (skipped when empty).
#   - verify_task_cleanup.sh: no Plan/ToDos file survives next to its Walkthrough.
#   - The validators' own unit tests (node --test and python3 -m unittest).
#
# Requires node and python3 on PATH.
#
# Usage: ./scripts/verify_docs.sh   (from the repository root)

echo "Starting Documentation Validation..."

# Workspaces under apps/ whose documents must stand alone (see
# .agents/rules/src-isolation.md), space separated, e.g. "apps/widget".
# Leave empty when no workspace is meant to be extracted to its own repository.
STANDALONE_WORKSPACES=""
FAILED=0

require_tool() {
  # $1 = command name. Records a failure with an install hint when absent.
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "❌ ERROR: '$1' is required by the documentation validators but is not on PATH."
    FAILED=1
  fi
}

run_check() {
  # $1 = label, remaining = command. Records a failure instead of exiting so
  # every validator reports in one pass.
  local label="$1"; shift
  echo "🔍 $label..."
  if "$@"; then
    echo "✅ $label passed."
  else
    echo "❌ $label failed."
    FAILED=1
  fi
}

require_tool node
require_tool python3
if [ "$FAILED" -ne 0 ]; then
  echo "🚨 VALIDATION FAILED: install the missing tools before committing."
  exit 1
fi

run_check "Validator unit tests (node)" node --test --test-reporter=dot scripts/docs/validate-adrs.test.mjs
run_check "Validator unit tests (python)" python3 -m unittest discover -q -s scripts/docs -p "test_*.py"
run_check "ADR structure (ISO 42010)" node scripts/docs/validate-adrs.mjs
run_check "PRD allocation" python3 scripts/docs/check_prd_allocation.py
run_check "Relative links and anchors" python3 scripts/docs/check_links.py
# shellcheck disable=SC2086  # STANDALONE_WORKSPACES is a space-separated list on purpose.
run_check "Standalone workspace links" python3 scripts/docs/check_workspace_links.py $STANDALONE_WORKSPACES
run_check "Task cleanup" ./scripts/verify_task_cleanup.sh

if [ "$FAILED" -ne 0 ]; then
  echo ""
  echo "🚨 VALIDATION FAILED: fix the documentation issues listed above before committing."
  exit 1
fi

echo "✅ Documentation validation passed."
exit 0
