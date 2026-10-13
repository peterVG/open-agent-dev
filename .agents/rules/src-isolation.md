---
description: Ensure each workspace's core execution directory (e.g., app/, src/, lib/, or src-tauri/src/) remains standalone, exportable, and free of global development tooling.
---

# Source Directory Isolation Rule

In this monorepo architecture (enforced via [`workspace-boundaries.md`](./workspace-boundaries.md)), an application or service resides within a dedicated workspace directory (e.g., `apps/frontend/` or `apps/my_app/`).

The primary execution directory **inside** each of these workspaces must contain the complete application codebase required to build and deploy that specific project. The primary design principle for any workspace's execution directory is to be **standalone and exportable**.

## Stack-Specific Execution Directories
- **For Python Stacks:** The execution directory is strictly `app/` (e.g., `apps/backend/app/`), replacing outdated `src/` patterns.
- **For JavaScript Stacks:** The execution directory is strictly `src/` (e.g., `apps/frontend/src/`) as dictated by modern bundlers like Vite or Next.
- **For BEAM/Elixir Stacks:** The execution directory is strictly `lib/` (e.g., `apps/my_app/lib/`) as dictated by OTP.
- **For Rust Stacks:** The execution directory is strictly `src/` for Cargo crates (e.g., `apps/core/src/`, `apps/backend/src/`). For the Tauri 2 host, the crate root is `apps/desktop/src-tauri/` and the execution directory is `apps/desktop/src-tauri/src/`. Do not put domain logic in `apps/desktop/` outside `src-tauri/`.

## Strict Isolation Requirements

1. **Self-Contained Execution:** All environment configuration files and dependency manifests (like `package.json`, `mix.exs`, `requirements.txt`, `Cargo.toml`, or `rust-toolchain.toml`) MUST reside at the root of the workspace directory (e.g. `apps/backend/`), or at the crate root for Tauri (`apps/desktop/src-tauri/`), while the actual executable application source code MUST be strictly placed inside its designated execution folder (`src/`, `app/`, `lib/`, or `src-tauri/src/`).
2. **Zero External Workspace Dependencies:** Code within a workspace's execution directory MUST NOT import from, rely on, or hard-link reference any files outside of its own workspace boundary. You should be able to copy or export an entire workspace folder (e.g., `apps/my_app/`) from this repository and have a fully functional, self-contained application.
   - *BEAM/Elixir Exception Handling*: In Elixir architectures, apps within `apps/` may sometimes rely on each other via `in_umbrella: true` or local `path: "../my_other_app"` directives in their `mix.exs`. To maintain the exportability mandate, `@AGENTS.md` MUST prefer sourcing shared dependencies via verified Hex packages or Git-referenced repositories whenever possible. Local path dependencies should exclusively be used only if the applications are truly inseparable parts of the exact same domain logic.
   - *Rust Exception Handling*: `apps/backend` and `apps/desktop/src-tauri` MAY path-depend on `apps/core` when they share domain logic. `apps/core` MUST NOT depend on Axum, Tokio-net, or `tauri`. Prefer crates.io or Git-referenced crates when the domain is independently versioned. Do not introduce a root `Cargo.toml` workspace to share code.
3. **No Global Dev Tooling in Execution Folders:** Monorepo-level management tools, global architecture decision records, AI agent configuration (`.agents`, `docs`, etc.), and global testing artifacts MUST be kept outside individual workspaces. The execution directory (`app/`, `src/`, `lib/`, or `src-tauri/src/`) of any app or service must remain deployment-ready and unpolluted by global meta-files.
