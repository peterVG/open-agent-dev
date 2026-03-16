---
description: Ensure all core documentation is updated before a Pull Request is prepared.
---

# Pull Request Documentation Updates

**Purpose:** Guarantee that the permanent project documentation stays strictly synchronized with the codebase whenever new features, architecture changes, or schema updates are introduced in a branch.

## Pre-PR Prompt Execution

Every time a Pull Request (PR) is being prepared by the AI agent, the agent MUST implicitly execute the following instruction as a required step before opening the PR:

> "update @docs/product-vision @docs/prd.md @docs/srs.md the ADRs and the Gherkin features based on the changes introduced in this branch."

## Execution Requirements

1. **Review Current Branch Changes:** The agent MUST review all commits, code changes, schema alterations, and new features introduced in the current working branch.
2. **Update Core Documents:** The agent MUST verify and update (`docs/product-vision.md`, `docs/prd.md`, `docs/srs.md`) to reflect the new state of the application.
3. **Architecture Decision Records:** The agent MUST ensure any architectural shifts (e.g. database schema changes, new core libraries, API structural changes) are formally documented as a new ADR in `docs/architecture/`.
4. **Behavioral Tests (Gherkin):** The agent MUST verify that the `.feature` files in `tests/features/` accurately reflect the updated acceptance criteria and system behaviors.
5. **Commit Updates:** The agent MUST commit these documentation updates to the current branch *before* completing the Pull Request creation process.
