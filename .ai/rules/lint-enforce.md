---
description: Enforce Ruff linting and formatting on all Python code changes.
---

# Linting and Formatting

All Python code in this project MUST be linted and formatted using **Ruff**.

1. Before committing any changes, or completing any task, you MUST run `ruff check --fix .` to automatically fix linting errors.
2. You MUST also run `ruff format .` to format the code.
3. If any linting errors cannot be fixed automatically by Ruff, you MUST resolve them manually before proceeding to tests or committing code.
4. Do not bypass the linter. All code must be strictly compliant with the project's Ruff configuration.
