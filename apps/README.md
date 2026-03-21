# Apps Directory (`/apps`)

This directory is an organizational **Workspace Boundary** within the Open Agent Dev monorepo. Its purpose is to group complete, user-facing client applications (e.g., `web`, `ios`, `desktop`) together.

## Purpose

By keeping these applications within `/apps/`, the repository root remains clean, language-agnostic, and purely structural. 

## Structure

Each application inside this directory should be a self-contained project with its own tooling and source code. For example:

- `/apps/web/`
  - `/apps/web/package.json` (Configuration and dependencies for the web frontend)
  - `/apps/web/src/` (The actual source code for the application)
  - `/apps/web/tests/` (The locally scoped tests for the application)

The `src/` directory within each application is the ultimate location for executable code, while the `/apps/` directory serves as the higher-level organizational boundary.

## What Goes Here
- Client-facing web applications
- Mobile applications
- Desktop applications

## What Does NOT Go Here
- Backend APIs or background workers (these should go in `/services/`)
- Shared monorepo packages/libraries (often placed in `/packages/`)
- Project-wide documentation or AI configurations