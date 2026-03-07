# Architecture Decision Record - Memory Garden
003-coding-standards-and-linting.md

1. **Title:** Selection of Coding Style Standards and Linting/Formatting Tools
2. **Status:** Accepted
3. **Context / Requirement Reference:** AGENTS.md mandates strict linting. The project uses JavaScript (Node.js/Express) and HTML5 Canvas. A unified code style is required to prevent merge conflicts and ensure readability.
4. **Decision:** 
   - **Coding Style:** Airbnb JavaScript Style Guide
   - **Linter:** ESLint
   - **Formatter:** Prettier
5. **Rationale:** ESLint is the undisputed standard for identifying problematic patterns in JavaScript. Prettier ensures a visually consistent codebase without manual developer effort. The Airbnb style guide provides comprehensive, widely-accepted JavaScript conventions.
6. **Assumptions:** Developers will use editor integrations (e.g., VSCode ESLint/Prettier plugins) for format-on-save workflows.
7. **Alternatives Considered:** 
   - StandardJS (rejected because it lacks the configurability of ESLint + Prettier).
   - JSHint/JSLint (deprecated/legacy tools).
8. **Consequences / Implications:** 
   - A pre-commit hook or strict CI check must enforce ESLint and Prettier rules.
   - All AI agents must automatically resolve linting errors before proposing code.
9. **Related Decisions / Notes:** See `.ai/rules/lint-enforce.md` for AI execution specifics and CLI commands.
