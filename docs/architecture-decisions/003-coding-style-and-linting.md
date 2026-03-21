# Architecture Decision Record - Arkrim Dragon
003-coding-style-and-linting.md

## Title: 003 - Coding Style and Linting Definitions
## Status: Accepted
## Context / Requirement Reference:
AI-generated code notoriously introduces hallucinated formatting deviations. Strict Pre-Commit linting enforcement is demanded by the `AGENTS.md` framework to lock styles globally.

## Decision:
- **Backend Tools**: `ruff` is selected as the exclusive formatter and linter.
- **Frontend Tools**: `eslint` and `prettier` are selected. 

## Rationale:
`ruff` replaces black, flake8, and isort instantaneously with massive Rust-based execution speed ups. `eslint/prettier` remains the immutable standard for Javascript.

## Assumptions:
Assumes developers rely strictly on the `.agents/rules/lint-enforce.md` constraints blocking execution unlreated to valid clean exits.

## Alternatives Considered:
- **Black / Flake8**: Rejected due to fragmented configuration states completely consolidated natively in `ruff`.

## Consequences / Implications:
Requires specific Git hooks or rigid developer workflows invoking `fix` parameters.

## Related Decisions / Notes:
See `lint-enforce.md`.
