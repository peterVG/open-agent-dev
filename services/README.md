# Services Directory (`/services`)

This directory is an organizational **Workspace Boundary** within the Open Agent Dev monorepo. Its purpose is to group backend APIs, microservices, and background workers together.

## Purpose

By keeping backend services within `/services/`, the repository root remains clean, language-agnostic, and purely structural. It allows a polyglot repository where a Python service and an Elixir service can coexist without polluting the top-level directory with their respective framework configurations.

## Structure

Each service inside this directory should be a self-contained project with its own tooling and source code. For example:

- `/services/auth-api/`
  - `/services/auth-api/pyproject.toml` (Configuration and dependencies for a Python service)
  - `/services/auth-api/src/` (The actual source code for the service)
  - `/services/auth-api/tests/` (The locally scoped tests for the service)

The `src/` directory within each service is the ultimate location for executable code, while the `/services/` directory serves as the higher-level organizational boundary.

## What Goes Here
- Backend REST or GraphQL APIs
- Background task workers
- Data processing pipelines

## What Does NOT Go Here
- Client-facing applications (these should go in `/apps/`)
- Shared monorepo packages/libraries (often placed in `/packages/`)
- Project-wide documentation or AI configurations
