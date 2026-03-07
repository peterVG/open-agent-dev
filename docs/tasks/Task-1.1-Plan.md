# Task 1.1: Project Setup & Package Management

## Objective
Initialize the Memory Garden Node.js project, install the dependencies defined in `package.json`, and configure the foundational tools (ESLint, Prettier, Jest, JSDoc) as mandated by ADRs `001`, `002`, and `003`. Establish the basic Express.js server structure.

## Requirements
- Node.js environment configured.
- ESLint configured using the `eslint-config-airbnb-base`.
- Prettier configured for consistent formatting.
- Jest configured for test execution.
- JSDoc configured for documentation generation.
- Basic Express.js server running in `src/server/index.js` as the application entry point.

## Design Decisions
- `src/server/index.js` will serve as the top-level application entry point. It will bootstrap the Express application and eventually the PostgreSQL connection and Geckos.io websockets.
- Standard configuration files (`.eslintrc.js`, `.prettierrc`, `jest.config.js`, `jsdoc.conf.json`) will be placed at the project root.
- A `.gitignore` already exists, but we will ensure it covers `node_modules` and standard build artifacts.

## Out of Scope
- Implementing the PostgreSQL schema (Task 1.2).
- Implementing Talon.js authentication (Task 1.3).
- Implementing the Internet Archive proxy routes (Task 2.1).
