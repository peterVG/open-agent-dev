---
description: Initialize a new BEAM/Elixir project with best practice root directory structure
---

# BEAM/Elixir Project Initialization

This skill guides the AI agent to initialize a new BEAM/Elixir project with the optimal directory structure dictated by the OTP (Open Telecom Platform) framework.

## Step 1: Scaffold the Root Directory Structure

When scaffolding a new project, you MUST create the following directory structure at the root, while keeping all the files and folders that are currently also in the root directory:

```text
project-root/
├── config/
├── deps/
├── doc/
├── ebin/
├── include/
├── lib/
│   ├── my_app/
│   └── my_app_web/
├── priv/
├── test/
├── mix.exs
├── mix.lock
└── README.md
```

Use appropriate Mix commands (`mix phx.new` or `mix new`) and system commands to generate this exact hierarchy within the repository root. 

### Populate the README.md file to explain directory structure

Populate the README.md file to explain the directory structure. Use the following verbatim text:

The best practice for structuring a BEAM project—whether written in Erlang or Elixir—is strictly dictated by the OTP (Open Telecom Platform) framework. Because the BEAM ecosystem expects code to be bundled as self-contained OTP applications, following standard directory layouts ensures compatibility with community build tools, releases, and hot code swapping mechanisms.

While Elixir modernizes some of the naming conventions (like using lib/ instead of src/), the underlying architecture remains identical. This is the standard, best-practice directory layout for a modern BEAM/Elixir project:

```text
project-root/
├── config/       # Application configuration files (e.g., test.exs, dev.exs)
├── deps/         # Third-party dependencies downloaded by the package manager
├── doc/          # Generated documentation (e.g., EDoc or ExDoc)
├── ebin/         # Compiled bytecode (.beam) and Application Resource (.app) files
├── include/      # Public header files (.hrl) required by other applications
├── lib/          # Main Elixir source code (or src/ for Erlang .erl files)
│   ├── my_app/       # Core business logic and stateful GenServers
│   └── my_app_web/   # Phoenix web interface (LiveViews, Controllers, etc.)
├── priv/         # Non-BEAM specific files (executables, C drivers, static web assets)
├── test/         # Test suites, ExUnit/EUnit files, and test helpers
├── mix.exs       # Elixir project configuration and dependencies list (or Emakefile)
└── mix.lock      # Locked versions of dependencies
└── README.md     # Explains this directory structure
```

**`lib/` (Elixir) or `src/` (Erlang):** This is where all of your main source code is stored. In a Phoenix web project, this directory is logically separated into distinct contexts: your core business logic (e.g., `lib/my_app/`) and your web presentation layer (e.g., `lib/my_app_web/live/`).
**`ebin/`:** The destination directory where the compiler places the resulting bytecode (`.beam` files). Crucially, this directory also holds the Application Resource File (`.app`), which describes the application, its version, and its dependencies to the BEAM virtual machine. (Note: In modern Elixir, the Mix build tool often manages this dynamically under a hidden `_build/` folder).
**`priv/`:** This directory is used for any specific non-Erlang/Elixir files your application needs to function. This includes custom C drivers, system executables, or static frontend assets for web applications.
**`include/`:** Used to store public header files (ending in `.hrl`) that might need to be included by other applications within your ecosystem. Private header files should remain hidden inside the `src/` or `lib/` directory.
**`test/`:** Holds all your automated test files (such as EUnit, Common Test, or ExUnit suites). Keeping tests here ensures they are isolated and not distributed as part of your compiled production release.
**`config/` (or `conf/`):** Dedicated to specific configuration files used to tune your application's environment variables for different stages, like testing or production.
**`deps/` (or `lib/` in older setups):** Where third-party libraries and dependencies are stored.
**`doc/`:** The destination for automatically generated documentation files, such as those created by EDoc.
**Root Build Files:** At the root of your project, you will typically have an `Emakefile` (for Erlang) or a `mix.exs` file (for Elixir) which defines how to compile the project, tracks test coverage configurations, and lists dependencies.

## Step 2: Configure Testing Frameworks

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

## Step 3: Generate linting rule

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

## Step 4: Generate Test Framework ADRs

Use the @.agents/rules/adr-formatting.md rule to write an ADR to the @docs/architecture/ direcory that explains the selected test runners and coding style standards.

## Step 5: Update Documentation

Update the ## Run tests section in the `README.md` in the project's root directory with instructions on how to execute each respective test suites, including which directories to run them from, where to find their raw results and how to get an overview of all test results in a tool like Allure.
