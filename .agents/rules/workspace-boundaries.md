---
description: Ensure the repository explicitly defines workspace boundaries (apps/ and services/) to maintain a language-agnostic root and proper separation of concerns.
---

# Monorepo Workspace Boundaries

The Open Agent Dev repository is structured as a polyglot Monorepo. To ensure different tech stacks can coexist without polluting the top-level directory, the repository enforces strict organizational boundaries: `/apps` and `/services`.

## 1. The Apps Directory (`/apps`)
This boundary groups complete, user-facing client applications (e.g., `web`, `ios`, `desktop`).
- **What Goes Here:** Client-facing web applications, mobile apps, desktop apps.
- **What Does NOT Go Here:** Backend APIs, workers, shared monorepo packages.

## 2. The Services Directory (`/services`)
This boundary groups backend APIs, microservices, and background workers.
- **What Goes Here:** Backend REST/GraphQL APIs, background task workers, data pipelines.
- **What Does NOT Go Here:** Client-facing applications, shared monorepo packages.

## Structure & Tooling Isolation

Each application or service inside these directories must be a self-contained project with its own tooling and source code. For example:

- `/apps/web/`
  - `/apps/web/package.json` (Configuration and dependencies isolated to this workspace)
  - `/apps/web/src/` (The ultimate location for executable code)
  - `/apps/web/tests/` (The locally scoped tests)

1. **No Language Tooling at Root:** You MUST NOT place language-specific dependency manifests (e.g., `package.json`, `mix.exs`, `requirements.txt`) or framework configuration files in the global repository root.
2. **Path Resolution:** When adding CI pipelines, executing tests, or running scripts, always execute language commands (like `npm run dev` or `pytest`) from within the specific workspace sub-directory, rather than the root.
