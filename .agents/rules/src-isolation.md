---
description: Ensure the src/ directory remains standalone, exportable, and free of development tooling.
---

# Source Directory Isolation Rule

The `/src` directory contains the entire application codebase and everything required to run the application in production. The primary design principle for the `/src` directory is to be **standalone and exportable**.

## Strict Isolation Requirements

1. **Self-Contained Execution:** All application code, configuration files, and dependency manifests necessary for running the application in production MUST reside within the `/src` directory (or its subdirectories).
2. **Zero External Dependencies:** Code within `/src` MUST NOT import from, rely on, or reference any files outside of the `/src` directory. You should be able to copy or export *only* the `/src` directory from this repository, and have a fully functional application.
3. **No Dev Tooling in `/src`:** Project-level management tools, architectural decision records, AI agent configuration (`.agents`, `docs`, etc.), and testing artifacts MUST be kept outside this directory. The `/src` folder must remain deployment-ready at all times.
