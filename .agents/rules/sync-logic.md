# Sync Logic Rule

## Context Refresh

Whenever a task starts, refresh context from @PRD, @SRS, @docs/architecture-decisions/, and @implementation_plan. If a conflict is found between any of these documents, stop and generate a 'Conflict Artifact' for human review.


## Conflict Detection

When reviewing the PRD, SRS, Architecture Decision Records (ADRs), and implementation plan documents:
- **PRD ↔ SRS:** Verify that system requirements in the SRS align with product requirements in the PRD
- **SRS ↔ ADRs:** Check that architectural decisions support the system requirements
- **PRD ↔ ADRs:** Ensure implementation design aligns with product vision
- **Implementation Plan ↔ SRS:** Verify planned implementation steps satisfy system requirements
- **Implementation Plan ↔ ADRs:** Ensure implementation approach follows architectural patterns
- **Codebase Reality ↔ Documentation:** If the agent discovers that the actual codebase structure (e.g. file paths, module names) deviates from what is documented in the PRD, SRS, ADRs, or Implementation Plan, the agent MUST NOT silently update the upstream documentation.
- Flag any contradictions in data models, API contracts, system boundaries, feature specifications, or file paths.

## Conflict Artifact Format

If a conflict is detected, create a conflict artifact that includes:
1. **Conflict Description:** Clear statement of the contradiction
2. **PRD Reference:** Specific section and quote from the PRD
3. **ADR Reference:** Specific section and quote from the relevant ADR
4. **Recommended Resolution:** Suggested approach to resolve the conflict, including a list of all project artifacts that need to be updated to resolve the conflict.
5. **Impact Assessment:** What would break if this conflict is not resolved

## README Synchronization

If there are any changes to the `docs/product-vision.md` or `docs/prd.md` artifacts, the agent MUST review the `# About this project` section in the root `README.md` and update it to reflect the latest project vision and requirements if needed.
