# Architecture Decision Record - Arkrim Dragon
002-inline-code-documentation.md

## Title: 002 - Inline Code Documentation Strategy
## Status: Accepted
## Context / Requirement Reference:
Because AI agents continually rewrite blocks of logical infrastructure, code documentation must aggressively conform to parsable, human-readable strings to satisfy `AGENTS.md`. We must select static docs generators for both Py and JS.

## Decision:
- **Backend (Python)**: Developers and agents MUST use standard `"""` docstrings conforming to the **Google Formatter**. Documentation generated universally by `pdoc`.
- **Frontend (Javascript)**: Agents MUST use standard `/** ... */` `JSDoc` comments atop all Svelte components and utility files.

## Rationale:
`pdoc` requires absolute zero configuration compared to `Sphinx` and parses native type hinting instantly mapping to Markdown HTML. JSDoc is completely native and readable natively by IDE LSP intellisense mechanisms without compilation.

## Assumptions:
Assumes strict adherence to `.agents/rules/docs-enforce.md`.

## Alternatives Considered:
- **Sphinx**: Rejected due to high configuration overhead and reStructuredText complexity.

## Consequences / Implications:
Minor maintenance required to keep Type hints perfectly linked to Docs.

## Related Decisions / Notes:
See `docs-enforce.md`.
