---
description: Ensure the repository root remains language-agnostic and free of framework tooling or package manifests.
---

# Strict Root Isolation & Monorepo Structure

The repository root MUST remain clean, language-agnostic, and purely structural. It is reserved exclusively for global project configurations (e.g., `.agents`, `docs`, `README.md`, `.gitignore`).

1. **No Language Tooling at Root:** You MUST NOT place language-specific dependency manifests (e.g., `package.json`, `mix.exs`, `cargo.toml`, `requirements.txt`) or framework configuration files (e.g., `jest.config.js`, `eslint.config.mjs`, `.prettierrc`) in the repository root.
2. **Component Isolation:** All application code and its associated tooling MUST be contained within a logically named subdirectory representing that service, application, or component (e.g., `apps/web/`, `apps/api/`, `services/worker/`).
3. **Paths & CI:** When adding CI pipelines, documentation, or scripts, always account for this nested directory structure. Always execute language commands (like `npm run format` or `mix test`) from within the specific sub-directory, rather than the root.
