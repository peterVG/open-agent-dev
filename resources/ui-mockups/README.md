# UI mockups

Design artifacts used when generating [`resources/srs.md`](../srs.md): wireframes, mockups, flows, and look-and-feel examples.

These files are **informative sources**, not product requirements. Outcome-level product needs stay in [`resources/prd.md`](../prd.md). The SRS writer converts what the mockups show into ISO/IEC/IEEE 29148 requirements that are unambiguous, verifiable, consistent, and traced.

## What goes here

- Wireframes and mid- or high-fidelity mockups (PNG, SVG, PDF, or HTML)
- Interaction flows and information-architecture diagrams
- Look-and-feel examples: visual hierarchy, layout regions, density, typography, color roles, empty/error/loading/offline states
- Optional notes beside a mockup that name the intended surface, states, and PRD feature IDs

Do **not** put mockups in `prd.md`, `docs/`, or `resources/references/`. Technical specs and standards stay in [`resources/references/`](../references/).

## How SRS generation uses these files

When generating or updating `srs.md`, the agent MUST:

1. Read every mockup and accompanying note in this directory.
2. Convert **UI features** into testable requirements: required surfaces, information shown, primary actions, navigation, and states (empty, loading, error, offline, permission-denied).
3. Convert **look-and-feel** into measurable constraints: layout regions (presence and purpose, not pixel coordinates), visual hierarchy, control density, typography scale, color roles, and contrast. Use RFC 2119 (`MUST` / `SHOULD` / `MAY`).
4. Cite each source mockup in the requirement `Source` block, with the related PRD `F-` / `NFR-` / `TC-` ID when one exists.
5. Map look-and-feel and presentation requirements to UI tests; map behavioral requirements to BDD scenarios.

Treat mockup files as illustrations. The SRS text is normative. Do **not** write screenshot-match or pixel-identical acceptance (desktop webviews are not required to match a mockup pixel-for-pixel). Do **not** copy subjective language such as “clean” or “modern” unless it is restated as a testable constraint.

If a mockup contradicts the PRD, halt and report the conflict. If a mockup shows a surface or state with no PRD ID, still specify it, cite the mockup, and record the PRD gap in the SRS traceability matrix.
