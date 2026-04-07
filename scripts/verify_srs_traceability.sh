#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting PRD/SRS Bi-directional Traceability Validation..."

PRD_FILE="docs/prd.md"
SRS_FILES=$(find apps -name "srs.md" 2>/dev/null)

if [ ! -f "$PRD_FILE" ]; then
  echo "🚨 VALIDATION FAILED: PRD file not found at $PRD_FILE"
  exit 1
fi

if [ -z "$SRS_FILES" ]; then
  # No SRS files to check
  echo "✅ Traceability Validation passed (skip: no srs.md files found)."
  exit 0
fi

# 1. Extract all PRD requirement IDs (e.g. FR-001, NFR-002, FR-AE-001)
# Looking for lines starting with '## ' or '### ' followed by an ID and a colon
PRD_IDS=$(grep -oE '^##+ (FR-[A-Z0-9-]+|NFR-[A-Z0-9-]+):' "$PRD_FILE" | awk '{print $2}' | sed 's/://g' | sort -u)

# 2. Extract all SRS references
# Looking for '[PRD FR-001]' inside srs.md files
SRS_REFS=$(grep -hoE '\[PRD (FR-[A-Z0-9-]+|NFR-[A-Z0-9-]+)\]' $SRS_FILES | sed 's/\[PRD //g' | sed 's/\]//g' | sort -u)

# Check 1: Do all SRS references exist in PRD? (Dead Link Check)
DEAD_LINKS=0
for REF in $SRS_REFS; do
  FOUND=0
  for ID in $PRD_IDS; do
    if [ "$REF" == "$ID" ]; then
      FOUND=1
      break
    fi
  done
  if [ "$FOUND" -eq 0 ]; then
    echo "❌ DEAD LINK: An SRS file references PRD ID '$REF', but it does not exist in $PRD_FILE!"
    DEAD_LINKS=1
  fi
done

# Check 2: Do all PRD functional requirements exist in SRS? (Orphan Requirement Check)
ORPHAN_REQS=0
for ID in $PRD_IDS; do
  # We only strictly enforce that Functional Requirements (FR-) must be mapped. 
  # NFRs are often more abstract and may not map 1:1 to a specific software constraint.
  if [[ "$ID" != FR-* ]]; then
    continue
  fi

  FOUND=0
  for REF in $SRS_REFS; do
    if [ "$ID" == "$REF" ]; then
      FOUND=1
      break
    fi
  done
  if [ "$FOUND" -eq 0 ]; then
    echo "❌ ORPHAN REQUIREMENT: PRD Functional Requirement '$ID' is not mapped to any SRS document!"
    ORPHAN_REQS=1
  fi
done

if [ "$DEAD_LINKS" -eq 1 ] || [ "$ORPHAN_REQS" -eq 1 ]; then
  echo ""
  echo "🚨 VALIDATION FAILED: Bi-directional Traceability rule violated."
  echo "All PRD functional and non-functional requirements must be mapped explicitly to an SRS file, and all SRS references must point to a valid PRD ID."
  exit 1
fi

echo "✅ Traceability Validation passed. PRD and SRS are fully synchronized."
exit 0
