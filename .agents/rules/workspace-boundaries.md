---
description: Ensure the repository explicitly defines workspace boundaries (apps/ and services/) to maintain a language-agnostic root and proper separation of concerns.
---

# Root Workspace Project Boundaries

The Open Agent Dev repository enforces strict organizational boundaries based on the initialization sequence chosen.

## 1. Python/Javascript Stack (Monorepo)
If initialized with the Python/JS stack, the application is structured as a polyglot Monorepo containing `/apps` and `/services`.
- **`/apps`**: Groups complete, user-facing client applications (e.g., the JavaScript/Next.js frontend in `apps/frontend/`).
- **`/services`**: Groups backend APIs, microservices, and background workers (e.g., the Python/FastAPI backend in `apps/backend/` or `services/api/`).

## 2. BEAM/Elixir Stack (Umbrella Project)
If initialized with the BEAM/Elixir stack, the application is structured as a standard Phoenix Umbrella project.
- **`/apps`**: In an Umbrella project, *both* backend logic and frontend web interfaces are stored as separate OTP applications inside the `/apps` directory (e.g., `apps/my_app/` and `apps/my_app_web/`).
- **Targeted Tooling**: The root contains the global umbrella configuration (`mix.exs`, `config/`), but all substantive code must execute within the scoped `apps/` folders.

## Structure & Tooling Isolation

Each application or service inside these directories must be a self-contained project with its own tooling and source code based on its stack.

**Python/JS Stack Example:**
- `/apps/frontend/`
  - `/apps/frontend/package.json`
  - `/apps/frontend/src/`
- `/apps/backend/`
  - `/apps/backend/requirements.txt`
  - `/apps/backend/app/`

**BEAM/Elixir Stack Example:**
- `/apps/my_app/`
  - `/apps/my_app/mix.exs`
  - `/apps/my_app/lib/`
  - `/apps/my_app/test/`

1. **No Language Tooling at Root:** You MUST NOT place language-specific dependency manifests (e.g., `package.json`, `mix.exs`, `requirements.txt`) or framework configuration files in the global repository root.
2. **Strict Scaffolding:** When generating or scaffolding a new project (e.g., running `mix phx.new`, `npx create-next-app`, or `cargo new`), you MUST execute the command to place the output inside `apps/` or `services/`. NEVER run a scaffolding command targeting the repository root.
3. **Path Resolution:** When adding CI pipelines, executing tests, or running scripts, always execute language commands (like `npm run dev` or `pytest`) from within the specific workspace sub-directory, rather than the root.
