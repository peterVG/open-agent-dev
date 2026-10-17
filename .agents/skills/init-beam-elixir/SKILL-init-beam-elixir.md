---
name: BEAM/Elixir Project Initialization
description: Initialize a new BEAM/Elixir (Phoenix) project with best practice root directory structure, apps/ isolation, ExUnit, Allure reporting, QA tooling, and the observability compose stack.
allowed-tools:
  - code_interpreter
references:
  - ../../kb/beam-elixir-stack.md
copyright: Pieter Van Garderen (2026)
license: MIT
---

# BEAM/Elixir Project Initialization

This skill guides the AI agent to initialize a new BEAM/Elixir project with the optimal directory structure dictated by the OTP (Open Telecom Platform) framework. It defines a generic Phoenix baseline. Anything beyond that baseline is added only when the PRD or an ADR requires it.

For stack background (OTP conventions, distribution, job processing, tooling trade-offs), load [`.agents/kb/beam-elixir-stack.md`](../../kb/beam-elixir-stack.md) before starting.

## Step 1: Scaffold the Root Directory Structure

When scaffolding a new project, you MUST create the following directory structure at the root, while keeping all the files and folders that are currently also in the root directory.

Each BEAM application (or umbrella project) lives under `apps/<app>/`, fully independent of the others (i.e., run `mix phx.new my_app` inside `apps/`). There is **no root `mix.exs`**. This complies with the "No Language Tooling at Root" rule in [`workspace-boundaries.md`](../../rules/workspace-boundaries.md).

```text
project-root/
├── .github/
│   └── workflows/    # CI pipelines (test, QA, release builds)
├── docker-compose.yml
├── .env
├── resources/
│   ├── product-vision.md
│   └── prd.md        # Global Product Requirements Document
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
│       ├── resources/
│       │   └── srs.md    # Local Software Requirements Specification linked to PRD
│       ├── mix.exs
│       └── mix.lock
└── README.md
```

The following are **optional** and are added only when the PRD or an ADR calls for them:

- `terraform/` and `ansible/` for infrastructure provisioning and release deployment.
- Multi-architecture release pipelines in `.github/workflows/`.
- An AI PR reviewer configuration file at the root (vendor per ADR).

Use appropriate Mix commands (`mix phx.new` or `mix new`) and ensure the generation targets a subdirectory within `apps/` (e.g. `apps/my_app/`), rather than the repository root. **CRITICAL: When scaffolding any new service or web module within the `/apps` directory, you MUST explicitly hardcode a unique HTTP port for its development server (e.g. `config/dev.exs`) by scanning the repository's existing applications and incrementing exactly +1 to ensure no two workspaces ever clash on the same port locally.** 

## Step 2: Enforce Documentation Traceability & Sync

Every BEAM/Elixir project MUST adhere rigidly to a Monorepo Requirements Engineering methodology. The AI agent MUST enforce the following rules when creating or updating requirements:

1. **Global Source of Truth:** `resources/prd.md` (with `resources/product-vision.md`) serves as the global orchestrator of the project's vision.
2. **Localized Specs:** Each application in `apps/` MUST maintain its own `apps/<app>/resources/srs.md` containing requirements strictly bounded to that specific application/node.
3. **Traceability Metadata:** Every `srs.md` MUST include a YAML frontmatter block at the top that explicitly links to the PRD. For example:
   ```yaml
   ---
   title: "MyApp Software Requirements Specification"
   parent: "../../../resources/prd.md"
   ---
   ```
4. **Line-by-Line Traceability:** Every requirement definition in an `srs.md` MUST explicitly link back to its parent requirement in `resources/prd.md` using relative markdown links (e.g., `[PRD F-001](../../../resources/prd.md#f-001-example)`).
5. **Active Sync Enforcement:** The agent MUST strictly adhere to the [`sync-logic.md`](../../rules/sync-logic.md) rule. If an architecture change happens in one app's `srs.md`, the agent MUST trace upward and update `resources/prd.md`, or laterally update other apps' `srs.md` if the change breaches an API boundary.

## Step 3: Enforce Distributed Methods & Orchestration

Every BEAM/Elixir project MUST follow these baseline patterns. Items marked *conditional* apply only when the PRD or ADRs require them.

1. **Architecture Agnostic:** Code MUST be portable between ARM64 and x86_64 without source code changes.
2. **Environment Parity (`runtime.exs`):** The system MUST use `config/runtime.exs` for all environment-specific configuration (secrets, URLs, ports, feature flags) read from environment variables at boot.
3. **Hardware Detection (conditional):** If the project uses Nx-based compute, `runtime.exs` SHOULD detect available hardware. If a CUDA-capable GPU is present, initialize the `EXLA` backend; otherwise fall back to the CPU backend for safe local testing.
4. **Functional Isolation (conditional):** If the PRD requires it, the system SHOULD support deployment as independent nodes (e.g., one node runs the web UI, another runs compute-heavy workers).
5. **Cluster & Discovery (conditional):** If multiple nodes are deployed, they MUST form a cluster with a cookie read from an environment variable (e.g. `RELEASE_COOKIE`). The cookie MUST NEVER be hard-coded in source, config files, or scripts. Nodes SHOULD discover each other using `libcluster` (e.g. via Gossip or DNSSRV).
6. **Job Processing:** Use Oban for persistent background jobs. *Conditional:* in a multi-node deployment, configure Oban queues per node so under-resourced nodes are not overloaded, and use Erlang `PartitionSupervisor` (or bounded queue concurrency) to cap concurrent compute-heavy tasks to the available hardware (e.g. GPU memory).

## Step 4: Enforce Technical Stack

### Mandatory baseline

You MUST configure the following dependencies in each app's `mix.exs` and supporting infrastructure:

* **Web:** `phoenix` and `phoenix_live_view`.
* **Data:** `ecto` / `ecto_sql` with Postgres (`postgrex`).
* **Jobs & Messaging:** `oban` for persistent job processing; Phoenix PubSub for live updates.
* **Testing:** ExUnit with `wallaby` and/or `phoenix_test` (see Step 6).
* **QA:** `credo`, `dialyxir`, `sobelow` (see Step 6).
* **Observability (Centralized Stack, per AGENTS.md §10):**
  - `logger_json`: Write unbuffered JSON objects to stdout. MUST configure to include `node()` metadata for Grafana filtering.
  - `prom_ex` & Prometheus: Auto-capture BEAM metrics (CPU, Oban queue depth, processes).
  - `opentelemetry`: Distributed tracing layer to correlate actions via Trace IDs.
  - Promtail (scraping stdout and pushing directly to Loki; an optional Redpanda buffer only when an ADR calls for it, via the `buffering` Compose profile), Loki (log aggregator), Grafana.

### Optional — only if the PRD/ADRs require it

Do not add these by default. Each one needs an ADR justifying it.

* **Pipelines & Distribution:** `broadway` for multi-stage pipelines; `libcluster` (node discovery); `horde` (distributed Supervisor/Registry); Distributed Erlang / RPC between nodes (prefer RPC or process aliases over REST/JSON between BEAM nodes).
* **Admin UI:** `oban_web`.
* **ML & Compute:** `nx`, `exla` (CUDA support), `bumblebee` (Hugging Face models inside the BEAM).
* **Vector Search:** `pgvector`.
* **Search:** a search engine client (e.g. Elasticsearch or OpenSearch) if Postgres full-text search is insufficient.
* **Object Storage:** S3-compatible object storage via e.g. `ex_aws_s3`, alongside Phoenix `allow_upload/3`.
* **Infrastructure Management:** Terraform (VMs, networks, or cloud resources) and Ansible (host provisioning, observability sidecars, and building/pushing Elixir Releases).

## Step 5: Populate the apps/README.md file

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
│       ├── resources/    # App-level SRS and implementation plan
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

**`apps/my_app/`:** In this monorepo structure, backend and frontend Phoenix code is grouped as a standalone OTP application nestled inside `apps/`. It maintains its own `config/`, `lib/`, `deps/`, `test/`, and `mix.exs` completely independent of the global project root. There is no root `mix.exs`.
**`lib/`**: Contains all main source code logic and context boundaries.
**Infrastructure Orchestration**: A `docker-compose.yml` file sits in the global project root. BEAM apps natively run via their local Mix environments. This compose file is responsible for orchestrating the centralized logging stack and local databases without containerizing the Elixir application itself.
**Testing Taxonomy**: Every app shares a comprehensive testing architecture supporting `unit/`, `integration/`, `ui/`, BDD `features/`, `performance/`, and standardized `allure-results/` test reporting. Test databases and artifacts are scoped to the application, not system-wide.
**Isolated Testing & Linting**: All cache directories and reporting suites MUST run and output within their local workspace directory (e.g. `apps/my_app/test/`) instead of the shared repository root.
**Centralized Logging / Observability**: All applications must route logs as unbuffered event streams exclusively to `stdout`. The ecosystem relies on a centralized observability stack (Promtail, Loki, Redpanda, Prometheus, Grafana) orchestrated via `docker-compose` to capture and index these logs, strictly forbidding local file logging.

## Step 6: Configure Testing Frameworks

### 1. BDD Feature-Driven Development Standard
To maintain BDD functionality, use the Elixir-native `Wallaby.Feature` macro (or PhoenixTest) atop ExUnit. Traditional Gherkin parser libraries (like WhiteBread or Cabbage) are not maintained for current Elixir versions; avoid them. Instead of `.feature` text files, write native Elixir scenarios in `test/features/` to maintain ecosystem compatibility while generating Allure test reports. Use the [`feature-writer`](../feature-writer/SKILL-feature-writer.md) skill to translate SRS requirements into these scenarios.

### 2. Test Artifact Isolation and Reporting
To guarantee clean project roots, all test-generated artifacts MUST be collapsed into the idiomatic Elixir `test/` directory.

- **Databases:** Postgres test databases use an app-scoped name (e.g. `my_app_test#{System.get_env("MIX_TEST_PARTITION")}`) in `config/test.exs`. If an ADR selects SQLite, route the file to `test/my_app_test.db` rather than the application root.
- **Test Reports:** Structured test reports MUST output directly to `test/allure-results/` and compile to `test/allure-report/` (see Section 3).
- **UI Snapshots:** Wallaby failure screenshots must be directed to `test/wallaby_screenshots/`.
- **Do not use plural custom directories:** Custom directories like `tests/` break native `mix test` conventions. The singular `test/` folder should exclusively contain both source logic and ephemeral test artifacts (safely `.gitignore`'d).

### 3. Allure Test Reporting Integration
Allure reads JUnit XML results natively. Configure ExUnit to emit JUnit XML into `test/allure-results/`:

1. **Add the formatter dependency:** Add `{:junit_formatter, "> 0.0.0", only: :test}` to the app's `mix.exs` (use the latest stable version).
2. **Configure the output directory** in `config/test.exs`:
   ```elixir
   config :junit_formatter,
     report_dir: "test/allure-results",
     report_file: "junit-results.xml",
     automatic_create_dir?: true,
     include_filename?: true
   ```
3. **Register the formatter** in `test/test_helper.exs`:
   ```elixir
   ExUnit.configure(formatters: [JUnitFormatter, ExUnit.CLIFormatter])
   ExUnit.start()
   ```
4. **Purge stale results:** Configure a cross-platform mix alias (e.g. `test: [fn _ -> File.rm_rf!("test/allure-results") end, "test"]`) so historical results are removed before each test cycle.
5. **Allure CLI:** Ensure the Allure command-line tool is installed. Generate the HTML report with `allure generate test/allure-results -o test/allure-report --clean`, or view it locally with `allure serve test/allure-results`.

### 4. PhoenixTest and Playwright Integration
To support robust End-to-End (E2E) and integration testing, configure both PhoenixTest and Playwright:

1. **PhoenixTest Setup:** 
   - Add `{:phoenix_test, "> 0.0.0", only: :test, runtime: false}` to your `mix.exs` dependencies (use the latest stable version).
   - Configure it to traverse LiveView and static pages within ExUnit tests without browser overhead.
2. **Playwright Setup (for JS/Browser E2E):**
   - Alternatively or additionally to Wallaby, if Playwright is preferred for deep browser automation interacting with LiveView:
   - Run `npm init playwright@latest` inside your `apps/my_app/assets/` (or equivalent) directory.
   - Configure Playwright to target the Phoenix test server port and ensure results are output to `test/playwright-results/` to respect the artifact isolation rule.

### 5. QA, Linting, and Security Analysis Standards
To ensure code quality and type safety, configure the following QA tools in your `mix.exs` dependencies. Use the latest stable versions compatible with the stack:

1. **Formatting:** Use the built-in `mix format` to enforce standard Elixir code style across the project.
2. **Credo** (`{:credo, "> 0.0.0", only: [:dev, :test], runtime: false}`): Focuses on code consistency and idiomatic Elixir. It catches high-level design smells that bytecode analysis might ignore. Fast and should be run frequently (`mix credo --strict`).
3. **Dialyzer/Dialyxir** (`{:dialyxir, "> 0.0.0", only: [:dev, :test], runtime: false}`): Uses "Success Typing" to catch type errors. Ensures the data boundaries and type checks are right.
4. **Boundary** (`{:boundary, "> 0.0.0", runtime: false}`): Enforces a modular design by preventing one module from calling internal functions of another module without a proper public API. Add `:boundary` to the `compilers` list in `mix.exs` and define boundaries per context. Violations surface as compiler warnings.
5. **Sobelow** (`{:sobelow, "> 0.0.0", only: [:dev, :test], runtime: false}`): Essential for Phoenix LiveView frontends to identify security vulnerabilities (like XSS or insecure uploads).

## Step 7: Configure Documentation Generation

Elixir has robust built-in standards for documentation. You must configure the project to use these native tools:

1. **Inline Documentation:** Use `@moduledoc` and `@doc` attributes to document all public modules and functions.
2. **Developer Documentation:** Add `{:ex_doc, "> 0.0.0", only: :dev, runtime: false}` (latest stable) to your `mix.exs` dependencies to generate HTML/Epub documentation using `mix docs`.

## Step 8: Generate Inline Documentation Rule

Create a `.agents/rules/docs-enforce.md` file that contains the following verbatim content:

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

## Step 9: Generate QA and Linting Rule

Create a `.agents/rules/qa-enforce.md` file that contains the following verbatim content:

---
description: Ensure all code is cleanly formatted, passes typing, boundary, and security checks before testing or committing.
---

# Parallel QA Execution and Linting Enforcement

**Purpose:** This rule dictates the exact QA pipeline and CLI commands that an AI agent MUST execute to validate both the Elixir backend codebase (typing, style, boundary isolation, security) and Javascript frontend assets.

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

### 4. Encapsulation Verification (Boundary)
* **Boundary:** Runs as a Mix compiler and reports cross-boundary calls as warnings.
```bash
mix compile --warnings-as-errors
```
*If this fails:* Expose the required function via a public API or correct the unauthorized cross-module call.

### 5. Format and Lint Frontend Assets
Navigate to the Phoenix assets directory (e.g., `apps/my_app/assets/`) and run the Javascript/CSS formatters and linters:
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

## Step 10: Generate Architecture Decision Records (ADRs)

Use the [`adr-formatting.md`](../../rules/adr-formatting.md) rule to write ADRs to the `resources/architecture/ADRs/` directory. Be sure to include separate ADRs specifically for the choice of:
1) Test runners and reporting frameworks (ExUnit, Wallaby/PhoenixTest, `junit_formatter` + Allure).
2) Inline code docs generators.
3) Parallel QA execution tools, coding style standards, and static typing tooling (including Credo, Dialyzer, and Sobelow).
4) Boundary enforcement (Boundary) to guarantee architectural encapsulation.
5) The centralized observability stack (Loki, Redpanda, Promtail, Prometheus, Grafana).
6) The `runtime.exs` environment configuration strategy.

If any optional items from Step 3 or Step 4 are adopted, also write an ADR for each (e.g. clustering and distributed registries, node-specific job routing, ML/compute backends and hardware fallback, object storage, provisioning tooling, RPC vs JSON REST between nodes).

## Step 11: Configure Global `.gitignore`

The root directory already contains a `.gitignore` file. You MUST strictly append the following lines to it to ensure proper exclusion of test artifacts, dependency caches, and selective tracking for test directories across the monorepo:

```text
# Test reports & artifacts
**/artifacts/
**/coverage/
**/playwright-report/
**/allure-results/
**/allure-report/
**/test/wallaby_screenshots/

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

## Step 12: Configure Observability Configurations

When initializing the observability stack, you MUST ensure that the raw configuration files required by the containers are present on the host and mapped correctly:

1. **Create `config/loki/local-config.yaml`**: Give Loki a basic local storage config (e.g. `auth_enabled: false` and filesystem chunks directories).
2. **Create `config/promtail/docker-config.yaml`**: Configure Promtail to scrape `/var/log` (or local file paths) and push them to the Loki client URL (`http://loki:3100/loki/api/v1/push`).
3. **Create `config/prometheus/prometheus.yml`**: Configure Prometheus to scrape `localhost:9090`, `loki:3100`, and `redpanda:9644`.
4. **Volume Mount Configurations**: Update the `docker-compose.yml` file to volume mount these local host files into the respective containers (e.g., `./config/loki/local-config.yaml:/etc/loki/local-config.yaml:ro`).

## Step 13: Update Documentation

1. **Insert** platform-agnostic Elixir/Erlang installation instructions into the top of the `README.md` file (e.g., referencing official guides or version managers like `asdf`, `mise`, etc.) to ensure a zero-friction setup for new developers. **CRITICAL: You MUST NOT delete or overwrite any existing content in the `README.md` file when adding this section.**
2. **Update** the `## Run tests` section (or append one if it doesn't exist) in the `README.md` in the project's root directory with instructions on how to execute each respective test suites, including which directories to run them from, where to find their raw results and how to get an overview of all test results in a tool like Allure. If Playwright is used, you MUST also explicitly instruct the user to run `npx playwright install` within their frontend setup routines so they download the necessary end-to-end testing browsers. **CRITICAL: You MUST NOT delete or overwrite any existing unrelated content in the `README.md` file when updating this section.**
3. **Update** the `## View logs` section (located under `# Setup Development Environment`) in the root `README.md` with explicit instructions on how to install/spin up the centralized logging tools (Loki, Redpanda, Promtail, Prometheus, Grafana) via `docker-compose`, and how to access the Grafana UI locally.
