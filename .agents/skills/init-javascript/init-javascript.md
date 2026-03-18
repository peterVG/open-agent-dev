---
description: Initialize a new JavaScript project with best practice root directory structure
---

# JavaScript Project Initialization

This skill guides the AI agent to initialize a new JavaScript/TypeScript project with the optimal directory structure, separating the frontend and backend, orchestrated by Docker.

## Step 1: Scaffold the Root Directory Structure

When scaffolding a new project, you MUST create the following directory structure at the root, while keeping ALL the files and folders that are currently also in the root directory.

```text
project-root/
├── .env                     # Secure storage for environment variables
├── package.json             # JavaScript dependencies (includes jest, cucumber, k6, allure, etc.)
├── eslint.config.js         # Code formatting and linting config (ESLint)
├── .prettierrc              # Code style formatting (Prettier)
├── jest.config.js           # Jest testing configuration
├── docker-compose.yml       # Orchestrates the full stack
├── Dockerfile               # app container configuration
├── app/                     # Main JavaScript source code
│   ├── src/                 # Source directory
│   │   ├── index.js         # Entry point for the server
│   │   ├── models/          # Database definitions
│   │   ├── schemas/         # Data validation models
│   │   └── routes/          # API endpoints
│   └── README.md            # Explains the directory structure
└── tests/                   # Consolidated testing infrastructure
    ├── unit/                # Jest/Vitest unit tests
    ├── integration/         # Jest/Vitest integration tests (utilizing MSW/Nock for HTTP mocking)
    ├── ui/                  # Playwright/Cypress UI tests
    ├── features/            # Cucumber-js BDD tests written in Gherkin domain-specific language
    ├── performance/         # k6 performance scripts to simulate user loads
    └── allure-results/      # Output directory for interactive Allure test execution reports
```

### Populate the app/README.md files to explain directory structure

Create and populate a new `README.md` files at the root of the `app/` directory to explain the recursive directory structures. 

## Step 2: Configure Testing Frameworks

The main test execution environment is driven by `jest` (or `vitest`), supported by various plugins and external tools.

## Tools and Frameworks

### 1. Core Testing Framework: `jest` / `vitest`
- **Purpose**: Extensively used for writing and executing unit, integration, and UI tests.
- **Configuration**: Managed via `jest.config.js` or `vitest.config.ts` at the root directory.
  - Automatically targets `tests/unit`, `tests/integration`, and `tests/ui`.
- **References in `package.json`**: `jest`, `vitest`.

### 2. HTTP Request Mocking: `msw` (Mock Service Worker) / `nock`
- **Purpose**: Used for capturing and replaying HTTP interactions, allowing tests to run quickly and deterministically without hitting live endpoints.

### 3. Behavior-Driven Development (BDD): `cucumber-js`
- **Purpose**: Used for writing tests in domain-specific language (Gherkin syntax).
- **Location**: BDD test definitions reside under `tests/features`.
- **References in `package.json`**: `@cucumber/cucumber`.

### 4. Performance Testing: `k6`
- **Purpose**: Used to simulate user loads and measure system limitations and responsiveness under stress.
- **Location**: Performance scripts reside under `tests/performance`.
- **References in `package.json`**: `k6` (or installed system-wide).

### 5. Test Reporting: `allure`
- **Purpose**: Generates interactive and highly detailed test execution reports.
- **Integration**: Plugs into test runners (e.g. `allure-jest`, `allure-cucumberjs`).
- **Configuration**: Results are configured to output to `tests/allure-results`.

### 6. Code Formatting and Linting: `eslint` & `prettier`
- **Purpose**: Ensures code quality, standard style, and formatting consistency for both backend and frontend JavaScript/TypeScript.
- **Configuration**: Defined in `eslint.config.js` (or `.eslintrc.js`) and `.prettierrc`.

## Directory Structure

The `tests/` directory is logically partitioned based on testing scope:
- `tests/unit/`: Focused, isolated tests for individual functions and classes.
- `tests/integration/`: Tests verifying interactions between multiple components or modules.
- `tests/ui/`: Tests dedicated to user interface workflows.
- `tests/features/`: BDD feature files and step definitions (`cucumber-js`).
- `tests/performance/`: Load testing scripts (`k6`).
- `tests/allure-results/`: Directory capturing real-time test output for Allure reporting.

## Best Practices
- Run code formatting and linting via `eslint` and `prettier` prior to running tests.
- Execute unit and integration tests via `jest` or `vitest`.
- Execute performance limits via `k6`.
- Execute behavior feature maps via `cucumber-js`.
- After a test run, compile `allure` results using the Allure CLI to generate viewable test coverage HTML reports.

## Step 3: Configure Documentation Generation

Clear documentation is critical for maintaining the separation of concerns in a monorepo.

Use `jsdoc` (or `typedoc` if using TypeScript) to automatically extract docstrings (which MUST follow JSDoc standards) and generate API documentation. Add them to your development dependencies in `package.json`.

## Step 4: Generate Inline Documentation Rule

Create a @.agents/rules/docs-enforce.md file that contains the following verbatim content:

---
description: Ensure all code is comprehensively documented using the standard inline documentation formats for this stack.
---

# Inline Documentation Enforcement

**Purpose:** This rule dictates how an AI agent MUST document the codebase to satisfy the Inline Documentation Mandate in `AGENTS.md`.

## Active Enforcement

Before declaring any coding task "complete" or writing tests, the agent MUST verify that the following components include verbose inline documentation that clearly explains their function and intended usage:

1.  **ALL** Classes
2.  **ALL** Functions / Methods
3.  **ALL** Modules
4.  **ALL** Complex or non-obvious code blocks

### JavaScript/TypeScript Standards
The agent MUST use standard JSDoc block comments (using `/** ... */`) adhering strictly to the recognized JSDoc format.
These docstrings MUST be parseable by `jsdoc` or `typedoc` to generate the final developer documentation site.

*Failure to document code according to these standards violates the core AGENTS.md manifesto.*

## Step 5: Generate linting rule

Create a @.agents/rules/lint-enforce.md file that contains the following verbatim content:  

---
description: Ensure all code is strictly linted and formatted before pushing or testing.
---

# Linting and Formatting Enforcement

**Purpose:** This file instructs the AI agent on exactly how to lint and format the codebase to satisfy the Test-Driven Development (TDD) linting mandate in `AGENTS.md`.

## Active Tools

Based on the accepted Architecture Decision Records (`docs/architecture/004-coding-style-and-linting.md`), this project uses:

- **ESLint** for static code analysis to quickly find and fix logic errors.
- **Prettier** for an opinionated, consistent code formatting style.

## Execution Requirements

Before running any tests, committing code, or completing an execution task, you MUST execute the following CLI commands to catch logical errors and automatically fix any formatting violations in the JavaScript/TypeScript codebase.

```bash
npm run format # Should map to: prettier --write .
npm run lint   # Should map to: eslint . --fix
```

## Agent Resolution Mandate

If the `npm run lint` command returns a non-zero exit code (indicating unresolved linting errors or warnings configured as errors), the agent **MUST NOT** proceed to testing or committing.

The agent MUST:

1. Review the specific CLI output of the linting errors.
2. Formulate a plan to fix the code logic causing the violations.
3. Apply the fixes.
4. Rerun `npm run lint` to verify all errors are resolved.

Only when ESLint exits cleanly (code 0) is the codebase considered valid for testing or PR submission.

## Step 6: Generate Architecture Decision Records (ADRs)

Use the @.agents/rules/adr-formatting.md rule to write ADRs to the @docs/architecture-decisions/ directory.

Be sure to include separate ADRs specifically for the choice of: 1) test runners, UI testing frameworks, Integration testing frameworks, Performance testing frameworks, and Test Reporting frameworks; 2) Inline code documentation and Developer documentation generation frameworks; and 3) Coding style standards and linting/formatting tools.

## Step 7: Update Documentation

1. **Insert** platform-agnostic Node.js installation instructions into the top of the `README.md` file (e.g., referencing official guides or version managers like `nvm`, `fnm`, `volta`, etc.) to ensure a zero-friction setup for new developers. **CRITICAL: You MUST NOT delete or overwrite any existing content in the `README.md` file when adding this section.**
2. **Update** the `## Run tests` section (or append one if it doesn't exist) in the `README.md` in the project's root directory with instructions on how to execute each respective test suites, including which directories to run them from, where to find their raw results and how to get an overview of all test results in a tool like Allure. **CRITICAL: You MUST NOT delete or overwrite any existing unrelated content in the `README.md` file when updating this section.**
