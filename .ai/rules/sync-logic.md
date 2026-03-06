# Sync Logic Rule

## Context Refresh

Whenever a task starts, refresh context from @PRD, @SRS, @architecture, and @implementation_plan. If a conflict is found between any of these documents, stop and generate a 'Conflict Artifact' for human review.

## Conflict Detection

When reviewing the PRD, SRS, architecture, and implementation plan documents:
- **PRD ↔ SRS:** Verify that system requirements in the SRS align with product requirements in the PRD
- **SRS ↔ Architecture:** Check that architectural decisions support the system requirements
- **PRD ↔ Architecture:** Ensure implementation design aligns with product vision
- **Implementation Plan ↔ SRS:** Verify planned implementation steps satisfy system requirements
- **Implementation Plan ↔ Architecture:** Ensure implementation approach follows architectural patterns
- Flag any contradictions in data models, API contracts, system boundaries, or feature specifications

## Conflict Artifact Format

If a conflict is detected, create a conflict artifact that includes:
1. **Conflict Description:** Clear statement of the contradiction
2. **PRD Reference:** Specific section and quote from the PRD
3. **Architecture Reference:** Specific section and quote from architecture.md
4. **Recommended Resolution:** Suggested approach to resolve the conflict
5. **Impact Assessment:** What would break if this conflict is not resolved
