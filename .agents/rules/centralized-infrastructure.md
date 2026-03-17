---
description: Ensure that shared infrastructure like Docker Compose remains centralized at the repository root for all workspaces to utilize.
---

# Centralized Infrastructure

Whether the Open Agent Dev repository is structured as a Polyglot Monorepo (Python/JS) or an Umbrella Project (BEAM/Elixir), application code is rigorously isolated in `/apps` and `/services`. However, underlying shared infrastructure MUST be centralized.

## Docker Compose at the Root

You MUST place the primary `docker-compose.yml` file at the repository root, **not** inside individual workspace directories (e.g., do not put it in `apps/web/`).

### Rationale

1. **Zero-Friction Setup:** A developer should be able to clone the repository and run `docker compose up -d` exactly once at the root to instantly provision all databases, message queues, and caches required for the entire project.
2. **Shared Services across Workspaces:** If the repository contains an Elixir backend in `apps/api/` and a Node.js worker in `services/worker/`, they will often need to talk to the exact same Postgres database or Redis cache. Even within a pure Elixir Umbrella project containing `apps/my_app` and `apps/my_app_web`, both OTP apps connect to the same backing database. Centralizing the `docker-compose.yml` prevents duplicate databases from being spun up.
3. **Language Agnosticism:** While `package.json` or `mix.exs` are specific to a single tech stack and belong inside their workspaces, a Docker container running PostgreSQL is entirely language-agnostic and serves as horizontal infrastructure for the whole repo.

## Implementation

When provisioning new databases or infrastructure dependencies during a task:
1. Append the new service to the root `docker-compose.yml`.
2. Ensure the individual application workspaces (e.g., `apps/web/`) connect to these localized Docker services via `.env` variables.
