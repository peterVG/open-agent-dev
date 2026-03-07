---
description: Ensure all code modifications pass ESLint and Prettier formatting checks.
---

# Lint Enforcement Rules

**Purpose:** To conform with the "Test-driven development" linting mandate in `AGENTS.md` and ADR `003-coding-standards-and-linting.md`, all code MUST be linted and formatted before test execution or merging.

### JavaScript (Express.js, Frontend Canvas, Geckos.io)

1. **Formatting:**
   The agent MUST automatically format any modified JavaScript files using Prettier.
   ```bash
   npx prettier --write <file_path>
   # or for the whole codebase:
   npx prettier --write "src/**/*.{js,jsx,ts,tsx}" "tests/**/*.{js,jsx,ts,tsx}"
   ```

2. **Linting:**
   The agent MUST automatically run ESLint and resolve any reported errors or warnings before concluding its task.
   ```bash
   npx eslint --fix <file_path>
   # or for the whole codebase:
   npx eslint --fix "src/**/*.{js,jsx,ts,tsx}" "tests/**/*.{js,jsx,ts,tsx}"
   ```

3. **Mandatory Execution:**
   Do not ask for user permission to fix simple linting errors (e.g., missing semicolons, unused variables, formatting issues). Run the `--fix` flags and incorporate the changes into your commit or task output automatically.
