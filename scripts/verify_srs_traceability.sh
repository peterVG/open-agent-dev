#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Pieter Van Garderen
#
# SPDX-License-Identifier: MIT
#
# PRD/SRS traceability validation.
#
# Checks three things, in order:
#   1. Every PRD requirement ID is a heading of the form "## F-001:", "## NFR-001:", "## TC-001:" or "## RC-001:".
#   2. Every "[PRD <ID>]" reference in the SRS files that exist (the product SRS
#      resources/srs.md and/or the module SRS files apps/*/resources/srs.md)
#      resolves to one of those headings.
#   3. Every PRD functional requirement (F-), non-functional requirement (NFR-) and technical constraint (TC-)
#      has a matching "### SRS-<ID>:" heading in the product SRS. Skipped, with
#      a message, while resources/srs.md does not exist yet.
# Exit code 0 when all checks that apply hold, 1 otherwise. The script never edits a file.
# When the PRD does not exist yet (a fresh repository), there is nothing to
# trace, so the script passes without checking. When the PRD exists but no SRS
# file does, the script passes with a message.

set -e

PRD_FILE="resources/prd.md"
SRS_FILE="resources/srs.md"
DEAD_LINKS=0
ORPHANS=0

list_srs_files() {
  # Prints every existing SRS file (product and module), one per line. Reads
  # the filesystem only.
  [ -f "$SRS_FILE" ] && echo "$SRS_FILE"
  find apps -path '*/resources/srs.md' -type f 2>/dev/null | sort
  return 0
}

list_prd_ids() {
  # Prints each PRD requirement ID (F-001, NFR-002, ...), one per line.
  grep -oE '^## (F|NFR|TC|RC)-[0-9]+:' "$PRD_FILE" | sed -E 's/^## //; s/:$//' | sort -u || true
}

check_dead_links() {
  # $1 = PRD IDs (newline-separated). Reads SRS file paths from stdin and sets
  # DEAD_LINKS=1 for each "[PRD <ID>]" reference that names no PRD heading.
  local prd_ids="$1" file ref
  while IFS= read -r file; do
    for ref in $(grep -oE '\[PRD (F|NFR|TC|RC)-[0-9]+\]' "$file" | sed -E 's/\[PRD //; s/\]//' | sort -u); do
      grep -qxF "$ref" <<< "$prd_ids" && continue
      echo "❌ DEAD LINK: $file references PRD ID '$ref', which is not a heading in $PRD_FILE"
      DEAD_LINKS=1
    done
  done
}

check_product_coverage() {
  # $1 = PRD IDs (newline-separated). Sets ORPHANS=1 for each PRD F-, NFR- or
  # TC- requirement without a "### SRS-<ID>:" heading in the product SRS.
  local prd_ids="$1" srs_headings id
  srs_headings=$(grep -oE '^### SRS-(F|NFR|TC)-[0-9]+:' "$SRS_FILE" | sed -E 's/^### SRS-//; s/:$//' | sort -u || true)
  for id in $prd_ids; do
    case "$id" in RC-*) continue ;; esac
    grep -qxF "$id" <<< "$srs_headings" && continue
    echo "❌ ORPHAN REQUIREMENT: PRD '$id' has no '### SRS-$id:' heading in $SRS_FILE"
    ORPHANS=1
  done
}

echo "Starting PRD/SRS Traceability Validation..."

if [ ! -f "$PRD_FILE" ]; then
  echo "ℹ️  $PRD_FILE not found yet: nothing to check."
  exit 0
fi

SRS_LIST=$(list_srs_files)
if [ -z "$SRS_LIST" ]; then
  echo "ℹ️  No SRS file found (resources/srs.md or apps/*/resources/srs.md): nothing to trace yet."
  exit 0
fi

PRD_IDS=$(list_prd_ids)

check_dead_links "$PRD_IDS" <<< "$SRS_LIST"

if [ -f "$SRS_FILE" ]; then
  check_product_coverage "$PRD_IDS"
else
  echo "ℹ️  $SRS_FILE not found yet: PRD-to-product-SRS coverage check skipped."
fi

if [ "$DEAD_LINKS" -eq 1 ] || [ "$ORPHANS" -eq 1 ]; then
  echo ""
  echo "🚨 VALIDATION FAILED: every SRS reference must point to a PRD heading, and every PRD F-, NFR- and TC- requirement must have a product-SRS heading."
  exit 1
fi

echo "✅ Traceability Validation passed: $(grep -c . <<< "$PRD_IDS" || true) PRD requirements checked against $(grep -c . <<< "$SRS_LIST") SRS file(s)."
exit 0
