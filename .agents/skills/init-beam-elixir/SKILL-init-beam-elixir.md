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
├── docker-compose.yml
├── .env
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
├── docker-compose.yml       # Orchestrates the observability stack and databases
├── .env                     # Secure storage for environment variables (DB credentials, API keys)
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

When writing or configuring code for this stack, you must adhere to the following principles:

**`apps/my_app/`:** In this monorepo structure, backend and frontend Phoenix code is grouped as a standalone OTP application nestled inside `apps/`. It maintains its own `config/`, `lib/`, `deps/`, `test/`, and `mix.exs` completely independent of the global project root.
**`lib/`**: Contains all main source code logic and context boundaries.
**Infrastructure Orchestration**: A `docker-compose.yml` file sits one directory higher in the global project root. Unlike containerized frontend/backend setups, BEAM apps natively run via their local Mix environments. This compose file is specifically responsible for orchestrating the centralized logging stack and local databases without containerizing the Elixir application itself.
**Testing Taxonomy**: Both apps share a comprehensive testing architecture supporting `unit/`, `integration/`, `ui/`, BDD `features/`, `performance/`, and standardized `allure-results/` test reporting. Elixir projects route Ecto test databases specifically to their application root rather than system-wide.
**Isolated Testing & Linting**: All global cache directories and reporting suites MUST strictly run and output within their local workspace directory (e.g. `apps/my_app/test/`) instead of the shared global repository root.
**Centralized Logging / Observability**: All applications must route logs as unbuffered event streams exclusively to `stdout`. The ecosystem relies on a centralized observability stack (Promtail, Loki, Redpanda, Prometheus, Grafana) orchestrated via `docker-compose` to capture and index these logs, strictly forbidding local file logging.

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
4. **Allure CLI:** Ensure that `allure-commandline` is accessible. To generate the final HTML report, run `allure generate test/allure-results -o test/allure-report --clean` and view it with `allure open test/allure-report`. You MUST configure a mix alias or test execution hook (e.g. `rm -rf test/allure-results`) to automatically purge historical JSON payloads before initiating new test cycles.

### 4. PhoenixTest and Playwright Integration
To support robust End-to-End (E2E) and integration testing, configure both PhoenixTest and Playwright:

1. **PhoenixTest Setup:** 
   - Add `{:phoenix_test, "~> 0.3.0", only: :test, runtime: false}` to your `mix.exs` dependencies.
   - Configure it to seamlessly traverse LiveView and static pages within ExUnit tests without overhead.
2. **Playwright Setup (for JS/Browser E2E):**
   - Alternatively or additionally to Wallaby, if Playwright is preferred for deep browser automation interacting with LiveView:
   - Run `npm init playwright@latest` inside your `apps/my_app_web/assets/` (or equivalent) directory.
   - Configure playwright to target the Phoenix test server port and ensure tests are output to `test/playwright-results/` to respect the artifact isolation rule.

### 5. QA, Linting, and Security Analysis Standards
To ensure code quality, predictable retries, and strict type safety, configure the following QA tools in your `mix.exs` dependencies. Instruct the agent to use the latest stable versions compatible with the stack:

1. **Formatting:** Use the built-in `mix format` to enforce standard Elixir code style across the project.
2. **Credo** (`{:credo, "> 0.0.0", only: [:dev, :test], runtime: false}`): Focuses on code consistency and "teaching" idiomatic Elixir. It catches high-level design smells that bytecode analysis might ignore. Fast and should be run frequently (`mix credo --strict`).
3. **Dialyzer/Dialyxir** (`{:dialyxir, "> 0.0.0", only: [:dev, :test], runtime: false}`): Uses "Success Typing" to catch type errors. Ensures the data boundaries and type checks are right.
4. **Litmus** (`{:litmus, "> 0.0.0", only: [:dev, :test], runtime: false}`): Performs "purity analysis" by checking if functions have side effects that aren't explicitly declared. Vital for predictable retries (idempotency in Oban), bytecode verification across OS environments, and statically identifying potential "uncaught" exceptions.
5. **Boundary** (`{:boundary, "> 0.0.0", runtime: false}`): Enforces a "pluggable" design by preventing one module from calling internal functions of another module without a proper public API. Requires defining boundaries in the `mix.exs` for each app. Fast and should be run frequently.
6. **Sobelow** (`{:sobelow, "> 0.0.0", only: [:dev, :test], runtime: false}`): Essential for Phoenix LiveView frontends to identify security vulnerabilities (like XSS or insecure uploads) where pure bytecode analysis falls short.

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

## Step 6: Generate QA and Linting Rule

Create a @.agents/rules/qa-enforce.md file that contains the following verbatim content:

---
description: Ensure all code is cleanly formatted, passes purity analysis, typings, and security checks before testing or committing.
---

# Parallel QA Execution and Linting Enforcement

**Purpose:** This rule dictates the exact QA pipeline and CLI commands that an AI agent MUST execute to validate both the Elixir backend codebase (purity, typing, styles, boundary isolation, security) and Javascript frontend assets.

## Active Enforcement

Before executing any test suite, or before declaring a coding task "complete", the agent MUST successfully execute the QA checks in the following parallel execution strategy (or enforce them sequentially, ensuring all pass):

### 1. Enforce Backend Formatting (Elixir & HEEx)
```bash
mix format --check-formatted
```
*If this fails:* Auto-fix the issues with `mix format`.

### 2. Style and Security Checks (Credo & Sobelow)
* **Credo:** Checks code style and idiomatic design smells.
```bash
mix credo --strict
```
* **Sobelow:** Checks for web security vulnerabilities (XSS, insecure uploads, etc.).
```bash
mix sobelow
```
*If these fail:* Read the output, modify the offending code to align with style/security standards.

### 3. Type Safety Validation (Dialyzer)
* **Dialyzer:** Builds/checks the PLT (Persistent Lookup Table) to ensure type safety.
```bash
mix dialyzer
```
*If this fails:* Proactively fix type mismatches or incorrect `@spec` definitions.

### 4. Bytecode Purity Analysis (Litmus)
* **Litmus:** Performs bytecode purity analysis and exception path tracing. Run each time *after* compiling to ensure functions intended to be idempotent remain pure and side-effect free.
```bash
mix compile && mix litmus
```
*If this fails:* Refactor logic to isolate side-effects explicitly and ensure core retryable paths remain pure.

### 5. Encapsulation Verification (Boundary)
* **Boundary:** Verifies no cross-app encapsulation leaks exist.
```bash
mix compile && mix boundary
```
*If this fails:* Expose the required private function via a public API or correct the unauthorized cross-module call.

### 6. Format and Lint Frontend Assets
Navigate to the Phoenix assets directory (e.g., `apps/my_app_web/assets/`) and run the Javascript/CSS formatters and linters:
```bash
npx prettier --write .
npx eslint . --fix
```

## Agent Resolution Mandate and Strict Testing

If any QA analyzers, linters, or formatters return a non-zero exit code, the agent **MUST NOT** proceed to testing or committing.

The agent MUST:
1. Review the specific CLI output of the failing QA tools.
2. Formulate a plan to fix the code logic causing the violations.
3. Apply the fixes.
4. Rerun all failing checks until everything resolves cleanly.

**Testing Strictness:** The agent MUST run `mix test` ONLY IF all the above QA checks pass successfully.

## Step 7: Generate Architecture Decision Records (ADRs)

Use the `@.agents/rules/adr-formatting.md` rule to write ADRs to the `@docs/architecture/` directory. Be sure to include separate ADRs specifically for the choice of:
1) Test runners and reporting frameworks.
2) Inline code docs generators.
3) Parallel QA execution tools, coding style standards, and static typing tooling (including Credo, Dialyzer, and Sobelow).
4) Bytecode purity analysis (Litmus) and boundary enforcement (Boundary) to guarantee idempotent retries and architectural encapsulation.
5) The centralized observability stack (Loki, Redpanda, Promtail, Prometheus, Grafana).

## Step 8: Configure Global `.gitignore`

The root directory already contains a `.gitignore` file. You MUST strictly append the following lines to it to ensure proper exclusion of test artifacts, dependency caches, and selective tracking for test directories across the monorepo:

```text
# Test reports & artifacts
**/artifacts/
**/coverage/
**/playwright-report/
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
2. **Update** the `## Run tests` section (or append one if it doesn't exist) in the `README.md` in the project's root directory with instructions on how to execute each respective test suites, including which directories to run them from, where to find their raw results and how to get an overview of all test results in a tool like Allure. You MUST also explicitly instruct the user to run `npx playwright install` within their frontend setup routines so they download the necessary end-to-end testing browsers. **CRITICAL: You MUST NOT delete or overwrite any existing unrelated content in the `README.md` file when updating this section.**
3. **Update** the `## View logs` section (located under `# Setup Development Environment`) in the root `README.md` with explicit instructions on how to install/spin up the centralized logging tools (Loki, Redpanda, Promtail, Prometheus, Grafana) via `docker-compose`, and how to access the Grafana UI locally.
