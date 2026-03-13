---
description: Ensure each workspace's src/ directory remains standalone, exportable, and free of global development tooling.
---

# Source Directory Isolation Rule

In this monorepo architecture (enforced via [`workspace-boundaries.md`](./workspace-boundaries.md)), an application or service resides within a dedicated workspace directory (e.g., `apps/web/` or `services/api/`).

The `src/` directory **inside** each of these workspaces (e.g., `apps/web/src/`) contains the complete application codebase required to build and deploy that specific project. The primary design principle for any workspace's `src/` directory is to be **standalone and exportable**.

## Strict Isolation Requirements

1. **Self-Contained Execution:** All application code, environment configuration files, and dependency manifests necessary to build and deploy the application MUST reside within the workspace directory, with executable code strictly placed inside its `src/` folder.
2. **Zero External Workspace Dependencies:** Code within a workspace's `src/` directory MUST NOT import from, rely on, or hard-link reference any files outside of its own workspace boundary. You should be able to copy or export an entire workspace folder (e.g., `apps/spotbrowse/`) from this repository and have a fully functional, self-contained application.
3. **No Global Dev Tooling in `src/`:** Monorepo-level management tools, global architecture decision records, AI agent configuration (`.agents`, `docs`, etc.), and global testing artifacts MUST be kept outside individual workspaces. The `src/` folder of any app or service must remain deployment-ready and unpolluted by global meta-files.
