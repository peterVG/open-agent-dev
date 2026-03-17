---
description: Ensure each workspace's src/ directory remains standalone, exportable, and free of global development tooling.
---

# Source Directory Isolation Rule

In this monorepo architecture (enforced via [`workspace-boundaries.md`](./workspace-boundaries.md)), an application or service resides within a dedicated workspace directory (e.g., `apps/frontend/` or `apps/my_app/`).

The primary execution directory **inside** each of these workspaces must contain the complete application codebase required to build and deploy that specific project. The primary design principle for any workspace's execution directory is to be **standalone and exportable**.

## Stack-Specific Execution Directories
- **For Python/JS Stacks:** The execution directory is typically `src/` (e.g., `apps/frontend/src/`) or `app/` (e.g., `apps/backend/app/`).
- **For BEAM/Elixir Stacks:** The execution directory is strictly `lib/` (e.g., `apps/my_app/lib/`) as dictated by OTP.

## Strict Isolation Requirements

1. **Self-Contained Execution:** All application code, environment configuration files, and dependency manifests necessary to build and deploy the application MUST reside within the workspace directory, with executable code strictly placed inside its designated execution folder (`src/`, `app/`, or `lib/`).
2. **Zero External Workspace Dependencies:** Code within a workspace's execution directory MUST NOT import from, rely on, or hard-link reference any files outside of its own workspace boundary. You should be able to copy or export an entire workspace folder (e.g., `apps/my_app/`) from this repository and have a fully functional, self-contained application.
3. **No Global Dev Tooling in Execution Folders:** Monorepo-level management tools, global architecture decision records, AI agent configuration (`.agents`, `docs`, etc.), and global testing artifacts MUST be kept outside individual workspaces. The `src/` or `lib/` folder of any app or service must remain deployment-ready and unpolluted by global meta-files.
