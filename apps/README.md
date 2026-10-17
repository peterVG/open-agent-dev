# Apps Directory (`/apps`)

This directory is an organizational **Workspace Boundary** using a monorepo approach.

## Purpose

By keeping applications strictly within `/apps/`, the repository root remains clean, language-agnostic, and purely structural. It explicitly forbids the installation of global language dependencies (e.g. `package.json`, `mix.exs`, `requirements.txt`) at the repository root.

## Structure

Each application inside this directory is considered a fully standalone project with its own tooling, tests, dependencies, and configuration layers.

**Python/JS Stack Example (Monorepo):**
- `/apps/frontend/` (for example, a SvelteKit application)
- `/apps/backend/` (for example, a FastAPI service)

**Rust/JS Stack Example (Monorepo):**
- `/apps/core/` (for example, a shared domain crate)
- `/apps/backend/` (for example, an Axum web service)
- `/apps/frontend/` (for example, a Vite web UI)

**BEAM/Elixir Stack Example (one app per folder):**
- `/apps/my_app/` (for example, the backend core logic layer)
- `/apps/my_app_web/` (for example, a standalone Phoenix web layer)

## What Goes Here
- Client-facing web applications
- Mobile applications
- Desktop applications
- Backend API services (e.g. `apps/backend/`)
- Background workers and message processors

## What Does NOT Go Here
- **Global Manifests:** Global language dependencies must never be hoisted out of `/apps/` to the repository root.
