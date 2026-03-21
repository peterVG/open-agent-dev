---
description: Initialize a new BEAM/Elixir project with best practice root directory structure
---

# BEAM/Elixir Project Initialization

This skill guides the AI agent to initialize a new BEAM/Elixir project with the optimal directory structure dictated by the OTP (Open Telecom Platform) framework.

## Step 1: Scaffold the Root Directory Structure

When scaffolding a new project, you MUST create the following directory structure at the root, while keeping all the files and folders that are currently also in the root directory:

**Proposed Resolution for Workspace Boundaries:**
When reviewing `.agents/rules/workspace-boundaries.md`, you may detect a contradiction regarding the placement of the `mix.exs` file. You MUST treat this project as a Polyglot Monorepo structure where each application inside `apps/` is fully independent (i.e., running `mix phx.new my_app` inside `apps/` instead of an umbrella project). This complies with the strict "No Language Tooling at Root" rule and is consistent with the directory structure shown below.

```text
project-root/
├── apps/
│   └── my_app/
│       ├── config/
│       ├── include/
│       ├── lib/
│       ├── priv/
│       ├── test/
│       │   ├── unit/
│       │   ├── integration/
│       │   ├── ui/
│       │   ├── features/
│       │   ├── performance/
│       │   └── allure-results/
│       ├── mix.exs
│       └── mix.lock
└── README.md
```

Use appropriate Mix commands (`mix phx.new` or `mix new`) and ensure the generation targets a subdirectory within `apps/` (e.g. `apps/my_app/`), rather than the repository root. 

## Step 2: Populate the apps/README.md file

Create and populate the `apps/README.md` file to explain the application directory structure. Use the following verbatim text:

The best practice for structuring a BEAM project—whether written in Erlang or Elixir—is strictly dictated by the OTP (Open Telecom Platform) framework. Because the BEAM ecosystem expects code to be bundled as self-contained OTP applications, following standard directory layouts ensures compatibility with community build tools, releases, and hot code swapping mechanisms.

While Elixir modernizes some of the naming conventions (like using lib/ instead of src/), the underlying architecture remains identical. This is the standard, best-practice directory layout for a modern BEAM/Elixir project:

```text
project-root/
├── apps/
│   └── my_app/
│       ├── config/       # Application configuration files (e.g., test.exs, dev.exs)
│       ├── include/      # Public header files (.hrl) required by other applications
│       ├── lib/          # Main Elixir source code (or src/ for Erlang .erl files)
│       ├── priv/         # Non-BEAM specific files (executables, static assets)
│       ├── test/         # Consolidated testing infrastructure
│       │   ├── unit/        
│       │   ├── integration/ 
│       │   ├── ui/          
│       │   ├── features/    
│       │   ├── performance/ 
│       │   └── allure-results/
│       ├── mix.exs       # Elixir project configuration and dependencies list
│       └── mix.lock      # Locked versions of dependencies
└── README.md     # Explains this directory structure
```

**`apps/my_app/`:** In this monorepo structure, backend and frontend Phoenix code is grouped as a standalone OTP application nestled inside `apps/`. It maintains its own `config/`, `lib/`, `deps/`, `test/`, and `mix.exs` completely independent of the global project root.
**`lib/`**: Contains all main source code logic and context boundaries.
**Testing Taxonomy**: Both apps share a comprehensive testing architecture supporting `unit/`, `integration/`, `ui/`, BDD `features/`, `performance/`, and standardized `allure-results/` test reporting. Elixir projects route Ecto test databases specifically to their application root rather than system-wide.
**12-Factor Logging / Observability**: All applications must route logs as unbuffered event streams exclusively to `stdout`. The ecosystem relies on a centralized observability stack (Promtail, Loki, Redpanda, Prometheus, Grafana) orchestrated via `docker-compose` to capture and index these logs, strictly forbidding local file logging.

## Step 3: Configure Testing Frameworks

### 1. BDD Feature-Driven Development Standard
To maintain BDD functionality, we use the Elixir-native `Wallaby.Feature` macro atop ExUnit. **Crucially, traditional Gherkin parser libraries (like WhiteBread or Cabbage) are deprecated and fundamentally broken on modern Elixir (v1.15+).** Instead of `.feature` text files, BEAM architects must write native Elixir scenarios in `test/features/` to maintain ecosystem compatibility while generating rich Allure test reports.

### 2. Test Artifact Isolation and Reporting
To guarantee clean project roots, all test-generated artifacts MUST be strictly collapsed into the idiomatic Elixir `test/` directory.

- **Databases:** Ecto test databases must be routed to `test/spotbrowse_test.db` in `config/test.exs` rather than the application root.
- **Test Reports:** Structured test reports (like Allure via `junit_formatter`) must output directly to `test/allure-results/` and compile to `test/allure-report/`.
- **UI Snapshots:** Wallaby failure screenshots must be directed to `test/wallaby_screenshots/`.
- **Do not use plural custom directories:** Custom directories like `tests/` break native `mix test` conventions. The singular `test/` folder should exclusively contain both source logic and ephemeral test artifacts (safely `.gitignore`'d).

### 3. Allure Test Reporting Integration
To properly configure Allure in a BEAM project, adhere to the following setup:

1. **Add `junit_formatter` to dependencies:** Add `{:junit_formatter, "~> 3.3", only: [:test]}` to your `mix.exs` file to generate the XML reports.
2. **Configure ExUnit formatter:** Update your `test/test_helper.exs` to include `ExUnit.configure(formatters: [JUnitFormatter, ExUnit.CLIFormatter])`.
3. **Set the output directory:** In `config/test.exs`, configure the extension so that the JUnit reports are sent to the correct isolated folder:
   ```elixir
   config :junit_formatter,
     report_dir: "test/allure-results",
     report_file: "test_results.xml",
     print_report_file: true
   ```
4. **Allure CLI:** Ensure that `allure-commandline` is accessible. To generate the final HTML report, run `allure generate test/allure-results -o test/allure-report --clean` and view it with `allure open test/allure-report`.

### 4. PhoenixTest and Playwright Integration
To support robust End-to-End (E2E) and integration testing, configure both PhoenixTest and Playwright:

1. **PhoenixTest Setup:** 
   - Add `{:phoenix_test, "~> 0.3.0", only: :test, runtime: false}` to your `mix.exs` dependencies.
   - Configure it to seamlessly traverse LiveView and static pages within ExUnit tests without overhead.
2. **Playwright Setup (for JS/Browser E2E):**
   - Alternatively or additionally to Wallaby, if Playwright is preferred for deep browser automation interacting with LiveView:
   - Run `npm init playwright@latest` inside your `apps/my_app_web/assets/` (or equivalent) directory.
   - Configure playwright to target the Phoenix test server port and ensure tests are output to `test/playwright-results/` to respect the artifact isolation rule.

### 5. Linting and Formatting Standard
To ensure code quality, consistent styling, and catch potential issues early, configure the following:
1. **Formatting:** Use the built-in `mix format` to enforce standard Elixir code style across the project.
2. **Linting:** Add `{:credo, "~> 1.7", only: [:dev, :test], runtime: false}` to your `mix.exs` dependencies to enforce strict code analysis and best practices. Run `mix credo --strict`.

## Step 4: Configure Documentation Generation

Elixir has robust built-in standards for documentation. You must configure the project to use these native tools:

1. **Inline Documentation:** Use `@moduledoc` and `@doc` attributes to document all public modules and functions.
2. **Developer Documentation:** Add `{:ex_doc, "~> 0.31", only: :dev, runtime: false}` to your `mix.exs` dependencies to generate HTML/Epub documentation using `mix docs`.

## Step 5: Generate Inline Documentation Rule

Create a @.agents/rules/docs-enforce.md file that contains the following verbatim content:

---
description: Ensure all code is comprehensively documented using Elixir's native documentation attributes.
---

# Inline Documentation Enforcement

**Purpose:** This rule dictates how an AI agent MUST document the codebase to satisfy the Inline Documentation Mandate in `AGENTS.md`.

## Active Enforcement

Before declaring any coding task "complete" or writing tests, the agent MUST verify that the following components include verbose inline documentation that clearly explains their function and intended usage:

1.  **ALL** Modules (using `@moduledoc`)
2.  **ALL** Public Functions and Macros (using `@doc`)
3.  **ALL** Complex or non-obvious private functions / code blocks (using inline `#` comments)

### Elixir (Backend) Standards
The agent MUST use standard Elixir documentation attributes. These attributes expect Markdown strings and MUST be placed immediately before the module/function definition.
These attributes MUST be parseable by `ex_doc` to generate the final developer documentation site.

### Javascript/CSS (Frontend) Standards
For custom frontend scripts in `assets/`, the agent MUST use standard `JSDoc` syntax (using `/** ... */`) for all functions and logic blocks.

*Failure to document code according to these standards violates the core AGENTS.md manifesto.*

## Step 6: Generate linting rule

Create a @.agents/rules/lint-enforce.md file that contains the following verbatim content:

---
description: Ensure all code is cleanly formatted, free of linting errors, and strictly typed before committing or testing.
---

# Strict Linting and Formatting Enforcement

**Purpose:** This rule dictates the exact CLI commands that an AI agent MUST execute to validate both the Elixir backend codebase against the official Elixir Style Guide, and the Javascript frontend assets against standard ESLint/Prettier configurations.

## Active Enforcement

Before executing any test suite, or before declaring a coding task "complete", the agent MUST run the following commands and ensure they all pass with a zero exit code:

### 1. Enforce Backend Formatting (Elixir & HEEx)
```bash
mix format --check-formatted
```
*If this fails:* The agent MUST proactively run `mix format` without the `--check-formatted` flag to auto-fix the issues before proceeding. (Note: Ensure `.formatter.exs` includes the `Phoenix.LiveView.HTMLFormatter` plugin for HEEx templates).

### 2. Enforce Strict Backend Linting
```bash
mix credo --strict
```
*If this fails:* The agent MUST proactively read the Credo output, modify the offending Elixir source code to align with the official Elixir Style Guide and idiomatic standards, and re-run the command until it passes.

### 3. Enforce Static Typing
```bash
mix dialyzer
```
*If this fails:* The agent MUST proactively fix the type mismatches or incorrect `@spec` definitions in the source code before proceeding.

### 4. Format and Lint Frontend Assets
Navigate to the Phoenix assets directory (e.g., `apps/my_app_web/assets/`) and run the Javascript/CSS formatters and linters:
```bash
npx prettier --write .
npx eslint . --fix
```
*If this fails:* The agent MUST resolve any lingering JS logical errors before proceeding.

## Step 7: Generate Architecture Decision Records (ADRs)

Use the @.agents/rules/adr-formatting.md rule to write ADRs to the @docs/architecture-decisions/ directory.

Be sure to include separate ADRs specifically for the choice of: 1) test runners, UI testing frameworks, Integration testing frameworks, Performance testing frameworks, and Test Reporting frameworks; 2) Inline code documentation and Developer documentation generation frameworks; and 3) Coding style standards and linting/formatting tools.

## Step 8: Configure Global `.gitignore`

The root directory already contains a `.gitignore` file. You MUST strictly append the following lines to it to ensure proper exclusion of test artifacts, dependency caches, and selective tracking for test directories across the monorepo:

```text
# Test reports & artifacts
**/allure-results/
test/wallaby_screenshots/

# Dependency directories
**/deps/
**/_build/
**/ebin/
**/doc/
*.beam

# Scratch files and transient tests
**/test-card.js
**/screenshot.spec.js

# Allow selective tracking in test/
**/test/*
!**/test/features/
!**/test/support/
!**/test/README.md
```

## Step 9: Update Documentation

1. **Insert** platform-agnostic Elixir/Erlang installation instructions into the top of the `README.md` file (e.g., referencing official guides or version managers like `asdf`, `mise`, etc.) to ensure a zero-friction setup for new developers. **CRITICAL: You MUST NOT delete or overwrite any existing content in the `README.md` file when adding this section.**
2. **Update** the `## Run tests` section (or append one if it doesn't exist) in the `README.md` in the project's root directory with instructions on how to execute each respective test suites, including which directories to run them from, where to find their raw results and how to get an overview of all test results in a tool like Allure. **CRITICAL: You MUST NOT delete or overwrite any existing unrelated content in the `README.md` file when updating this section.**
3. **Update** the `## View logs` section (located under `# Setup Development Environment`) in the root `README.md` with explicit instructions on how to install/spin up the centralized logging tools (Loki, Redpanda, Promtail, Prometheus, Grafana) via `docker-compose`, and how to access the Grafana UI locally.
