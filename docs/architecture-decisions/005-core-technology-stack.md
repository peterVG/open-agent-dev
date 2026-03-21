# Architecture Decision Record - Arkrim Dragon
005-core-technology-stack.md

## Title: 005 - Core Application Technology Stack
## Status: Accepted
## Context / Requirement Reference:
The `docs/prd.md` and `docs/srs.md` explicitly mandate a specific suite of highly performant technologies to facilitate the infinite WebGL canvas and massive async API data loading required for the Dragon Avatar mechanics.

## Decision:
We implement the following exact technologies natively inside the monorepo `apps/` compartment:
- **Frontend (Visuals/Canvas):** SvelteKit with HTML5 canvas.
- **Websockets:** geckos.io for UDP/WebRTC style fast multiplexed positional syncing.
- **Backend:** FastAPI (Python).
- **Database:** SQLite for local operations.
- **Storage:** DigitalOcean S3 droplets for external BLOB storage.
- **Integrations:** REST/GraphQL proxy APIs mapped directly natively to the Python backend.

## Rationale:
SvelteKit provides practically zero hydration overhead mapped atop raw HTML5 Canvas logic. FastAPI delivers the absolute highest asynchronous Python routing available natively, processing S3 payloads without blocking OS threads. 

## Assumptions:
Assumes developers adhere to the "API-First Design" constraint mapping all SvelteKit UI requests natively to Python `/api/v1` routes.

## Alternatives Considered:
- **Express.js / Postgres / Node.js**: Rejected as an older technical constraint explicitly scrubbed from `srs.md` to guarantee lightweight deployment footprints and Scale-To-Zero architectures.

## Consequences / Implications:
Requires utilizing raw Canvas API bindings internally within Svelte.

## Related Decisions / Notes:
See `docs/prd.md` and `docs/srs.md` technical constraints.
