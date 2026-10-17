---
trigger: always_on
description: Ensure the repository explicitly defines workspace boundaries (apps/) to maintain a language-agnostic root and proper separation of concerns.
copyright: Pieter Van Garderen (2026)
license: CC-BY
---

# Root Workspace Project Boundaries

The Open Agent Dev repository enforces strict organizational boundaries based on the initialization sequence chosen.

## 1. Python/Javascript Stack (Monorepo)
If initialized with the Python/JS stack, the application is structured as a polyglot Monorepo containing `/apps` exclusively.
- **`/apps`**: Houses all independent, deployable applications, regardless of whether they are client-side or server-side (e.g., the JavaScript frontend in `apps/frontend/` and the Python API in `apps/backend/`).

## 2. BEAM/Elixir Stack (Umbrella Project)
If initialized with the BEAM/Elixir stack, the application is structured as a standard Phoenix Umbrella project.
- **`/apps`**: In an Umbrella project, *both* backend logic and frontend web interfaces are stored as separate OTP applications inside the `/apps` directory (e.g., `apps/my_app/` and `apps/my_app_web/`).
- **Targeted Tooling**: The root contains the global umbrella configuration (`mix.exs`, `config/`), but all substantive code must execute within the scoped `apps/` folders.

## 3. Rust/Javascript Stack (Web + Tauri desktop)
If initialized with the Rust/JS stack, the application is structured as a polyglot Monorepo containing `/apps` exclusively.
- **`/apps`**: Houses independent crates and the shared UI (e.g., `apps/core/`, `apps/backend/`, `apps/frontend/`, `apps/desktop/`). The Axum web host and the Tauri 2 desktop host are separate deployables. Do not add a root `Cargo.toml` workspace.

## Structure & Tooling Isolation

Each application inside the apps directory must be a self-contained project with its own tooling and source code based on its stack.

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

**Rust/JS Stack Example:**
- `/apps/core/`
  - `/apps/core/Cargo.toml`
  - `/apps/core/src/`
- `/apps/backend/`
  - `/apps/backend/Cargo.toml`
  - `/apps/backend/src/`
- `/apps/frontend/`
  - `/apps/frontend/package.json`
  - `/apps/frontend/src/`
- `/apps/desktop/`
  - `/apps/desktop/src-tauri/Cargo.toml`
  - `/apps/desktop/src-tauri/src/`
  - `/apps/desktop/src-tauri/tauri.conf.json`

1. **No Language Tooling at Root:** You MUST NOT place language-specific dependency manifests (e.g., `package.json`, `mix.exs`, `requirements.txt`, `Cargo.toml`, `rust-toolchain.toml`) or framework configuration files in the global repository root.
2. **Strict Scaffolding:** When generating or scaffolding a new project (e.g., running `mix phx.new`, `npx create-next-app`, `cargo new`, or `npm create tauri-app`), you MUST execute the command to place the output inside `apps/`. NEVER run a scaffolding command targeting the repository root. If a scaffolder writes `package.json` next to `src-tauri/` (Tauri), relocate the frontend into `apps/frontend/` and the Rust host into `apps/desktop/src-tauri/`.
3. **Path Resolution:** When adding CI pipelines, executing tests, or running scripts, always execute language commands (like `npm run dev`, `pytest`, `mix test`, `cargo test`, or `npx tauri`) from within the specific workspace sub-directory, rather than the root. For Tauri, the Cargo crate root is `apps/desktop/src-tauri/`.
4. **Unique Port Assignments:** When scaffolding any new service or web module within the `/apps` directory, you MUST explicitly hardcode a unique HTTP port for its development server (e.g. `config/dev.exs`, `vite.config.ts`, Axum bind address, or Tauri `build.devUrl`) by scanning the repository's existing applications and incrementing exactly +1 to ensure no two workspaces ever clash on the same port locally.