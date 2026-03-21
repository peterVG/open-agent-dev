# Architecture Decision Record - Arkrim Dragon
001-test-frameworks.md

## Title: 001 - Test Frameworks Selection
## Status: Accepted
## Context / Requirement Reference:
Arkrim Dragon necessitates a diverse testing taxonomy adhering strictly to the `AGENTS.md` definitions encompassing unit, integration, UI, BDD feature scenarios, and performance profiling. A suite of test runners and standardized reporting output mechanisms must be chosen for both the SvelteKit frontend and FastAPI backend mapped in `prd.md`.

## Decision:
The project uses the following testing ecosystem:
- **Backend**: `pytest` for unit and integration; `behave` for BDD features; `locust` for performance telemetry.
- **Frontend**: `vitest` for Svelte unit logic; `@playwright/test` for robust E2E and HTML5 canvas simulation.
- **Test Reporting**: `allure-pytest` and `allure-behave` generating granular XML blobs locally to `tests/allure-results/`. 

## Rationale:
Pytest and Vitest offer native, lightning-fast execution and massive ecosystems perfectly matched for Python and Vite integrations. Playwright offers substantially better modern async execution debugging compared to Cypress for heavily dynamic SvelteKit canvas components. Allure provides universal XML/HTML reporting schemas.

## Assumptions:
Assumes developers rely strictly on single-node execution and isolated workspace domains preventing Pytest caches from leaking.

## Alternatives Considered:
- **Cypress**: Rejected due to heavier payload constraints mapping headless Chromium versus Playwright.

## Consequences / Implications:
Requires specific `.gitignore` constraints preventing allure XML outputs from bloat tracking.

## Related Decisions / Notes:
None at this time.
