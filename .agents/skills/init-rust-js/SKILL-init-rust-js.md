---
name: Rust/JavaScript Project Initialization
description: Initialize a Rust and JavaScript monorepo with an Axum web application and a Tauri 2 desktop host, apps/ isolation, Cargo, Playwright, Allure, and the observability compose stack.
allowed-tools:
  - code_interpreter
references:
  - ../../kb/tauri-2.md
copyright: Pieter Van Garderen (2026)
license: CC-BY
---

# Rust / JavaScript Project Initialization

This skill guides the AI agent to initialize a **Rust + JavaScript** monorepo. It is the Rust equivalent of the Python/JS and BEAM/Elixir init skills. The same JavaScript UI is hosted two ways: an **Axum web application** and a **Tauri 2 desktop application**.

**When to use:** The user asks to initialize a Rust project, scaffold Axum and/or Tauri 2, or run this skill. **Do not** run [init-python-js](../init-python-js/SKILL-init-python-js.md) or [init-beam-elixir](../init-beam-elixir/SKILL-init-beam-elixir.md) for this stack.

**Hard constraints (already accepted unless a later ADR supersedes them):**
- Language manifests (`Cargo.toml`, `package.json`, `rust-toolchain.toml`) MUST live **inside each app**, never at the repository root.
- Stay on **stable Tauri major 2**. Do not adopt Tauri 3 prereleases or unfiltered “Latest” badges. Recheck crates.io/npm and [tauri-2.md](../../kb/tauri-2.md) before pinning.
- Domain logic lives in Rust. The JavaScript UI talks HTTP (web) or typed Tauri IPC (desktop). Do not put privileged filesystem, process, or secret operations in the frontend.
- Plugin logging is unbuffered **stdout** (`tracing`). MUST NOT open log files on disk ([logging-enforce.md](../../rules/logging-enforce.md)).
- Docker Compose at the repo root orchestrates backing services and the **web** host. The Tauri desktop host runs **natively** on the developer OS (system webviews). Do not containerize `apps/desktop`.

Keep every file and folder already in the repository root. Do not delete product-vision, PRD, ADRs, or `.agents/`.

**Progressive disclosure:** Before writing Tauri commands, capabilities, plugins, packaging, or updater code, load [`.agents/kb/tauri-2.md`](../../kb/tauri-2.md) (Agent contract, Release snapshot, and Security model first). Do not invent permission identifiers, Cargo features, configuration fields, or JS import paths.

---

## Step 1: Scaffold the Root Directory Structure

Follow the Rust/Javascript section in [workspace-boundaries.md](../../rules/workspace-boundaries.md). Treat this project as a **polyglot monorepo** whose deployable apps live inside `apps/`. Rust crates use `src/` (Cargo), not Python’s `app/` folder. The Tauri crate root is `apps/desktop/src-tauri/`.

```text
project-root/
├── docker-compose.yml
├── .env
├── config/
│   ├── loki/
│   ├── promtail/
│   └── prometheus/
├── .github/
│   └── workflows/                 # Native CI matrix: Linux, Windows, macOS
├── apps/
│   ├── README.md
│   ├── core/                      # Shared Rust domain crate (no HTTP, no Tauri)
│   │   ├── Cargo.toml
│   │   ├── Cargo.lock
│   │   ├── rust-toolchain.toml
│   │   ├── src/
│   │   │   ├── lib.rs
│   │   │   ├── core/
│   │   │   └── modules/
│   │   ├── tests/
│   │   │   ├── unit/
│   │   │   ├── integration/
│   │   │   ├── features/
│   │   │   ├── performance/
│   │   │   └── allure-results/
│   │   └── resources/
│   │       └── srs.md
│   ├── backend/                   # Axum web host
│   │   ├── Cargo.toml
│   │   ├── Cargo.lock
│   │   ├── rust-toolchain.toml
│   │   ├── Dockerfile
│   │   ├── src/
│   │   │   ├── lib.rs             # HTTP composition; depends on apps/core
│   │   │   ├── main.rs            # Web binary
│   │   │   ├── routes/
│   │   │   └── telemetry.rs
│   │   ├── tests/
│   │   │   ├── unit/
│   │   │   ├── integration/
│   │   │   ├── features/
│   │   │   ├── performance/
│   │   │   └── allure-results/
│   │   └── resources/
│   │       └── srs.md
│   ├── frontend/                  # JavaScript/TypeScript UI (web + desktop)
│   │   ├── package.json
│   │   ├── public/
│   │   ├── src/
│   │   │   ├── main.js
│   │   │   ├── components/
│   │   │   ├── api/               # HTTP client for the Axum host
│   │   │   └── native/            # Tauri invoke wrappers (desktop only)
│   │   ├── tests/
│   │   │   ├── unit/
│   │   │   ├── ui/
│   │   │   ├── e2e/
│   │   │   ├── features/
│   │   │   ├── performance/
│   │   │   └── allure-results/
│   │   └── Dockerfile
│   └── desktop/                   # Tauri 2 host (native)
│       ├── src-tauri/
│       │   ├── Cargo.toml
│       │   ├── Cargo.lock
│       │   ├── rust-toolchain.toml
│       │   ├── build.rs
│       │   ├── tauri.conf.json
│       │   ├── capabilities/
│       │   ├── permissions/
│       │   ├── icons/
│       │   ├── src/
│       │   │   ├── lib.rs
│       │   │   └── main.rs
│       │   └── tests/             # Cargo tests (crate root is src-tauri/)
│       │       ├── unit/
│       │       ├── integration/
│       │       ├── features/
│       │       ├── performance/
│       │       └── allure-results/
│       ├── tests/                 # WebdriverIO native e2e (Node, not Cargo)
│       │   └── e2e/
│       └── resources/
│           └── srs.md
└── README.md
```

Use Cargo and the frontend scaffolder **inside** `apps/` (`cargo new` in `apps/core`, `apps/backend`; Vite/React/Svelte/etc. in `apps/frontend`). **DO NOT** generate workspace manifests or applications inside the repository root. **DO NOT** generate `apps/frontend` + `apps/backend` as FastAPI/SPA Python, Phoenix OTP apps, or WordPress plugins.

**Tauri scaffolder:** `npm create tauri-app` writes `package.json` next to `src-tauri/`. If you use it, run it in a scratch directory and **relocate** the frontend into `apps/frontend/` and the Rust host into `apps/desktop/src-tauri/` so no `package.json` / `Cargo.toml` lands at the repository root. Prefer composing Tauri by hand on top of the Vite app in `apps/frontend/`.

**Ports:** When adding Compose services or Vite/Axum/Tauri `devUrl` ports, scan existing published ports and increment by +1 so they never clash ([port-conflicts](../../rules/port-conflicts.md)). Keep the Vite/Tauri dev port **fixed** (`strictPort` or equivalent) and fail on conflicts. Document chosen ports in `docker-compose.yml`, `tauri.conf.json`, and the root README.

**Shared domain:** `apps/core` MUST contain domain types and use-cases with **no** Axum, reqwest server, or `tauri` dependency. `apps/backend` and `apps/desktop/src-tauri` depend on it via `path = "../core"` / `path = "../../core"`. Do not duplicate domain logic in Tauri commands or Axum handlers.

**No root Cargo workspace:** Independent crates inside `apps/` satisfy “No Language Tooling at Root”. Do not add a root `Cargo.toml`.

---

## Step 2: Enforce Documentation Traceability & Sync

Same monorepo requirements method as the BEAM init skill, with PRD at `resources/prd.md` (this repo does not use root `prd.md`).

1. **Global source of truth:** [`resources/prd.md`](../../../resources/prd.md) and [`resources/product-vision.md`](../../../resources/product-vision.md).
2. **Localized specs:** Each app MUST have `resources/srs.md` bounded to that app (`core`, `backend`, `frontend`, `desktop`).
3. **Traceability metadata** at the top of each `srs.md`:
   ```yaml
   ---
   title: "Backend Software Requirements Specification"
   parent: "../../../resources/prd.md"
   ---
   ```
4. **Line-by-line traceability:** Every SRS requirement MUST link to its parent in `resources/prd.md` with a relative markdown link (e.g. `[PRD F-001](../../../resources/prd.md#f-001-example)`).
5. **Sync:** Follow [sync-logic.md](../../rules/sync-logic.md). Backend/desktop SRS changes that share domain behaviour MUST update `apps/core` SRS and the root PRD.

---

## Step 3: Enforce Technical Stack

You MUST configure the following. Do not add FastAPI, Phoenix, WordPress, Actix, Rocket, Dioxus, or Leptos unless a later ADR explicitly replaces this stack.

**Web runtime (production):**
- Stable Rust toolchain pinned in each crate’s `rust-toolchain.toml` (`channel = "stable"`, components `rustfmt` and `clippy`). Verify the current stable compiler against the actual dependency graph; do not copy an old MSRV from a plugin README.
- **Axum** on **Tokio**, with `tower-http` as needed (trace, CORS, compression). JSON via Serde.
- Domain-driven modules in `apps/core/src/modules/`. HTTP adapters in `apps/backend/src/routes/`. Health checks live in the web binary.
- Persistence via **SQLx** (or an ADR-justified alternative) against Compose-backed Postgres for the web host. Bind parameters; never interpolate SQL.
- `tracing` + `tracing-subscriber` JSON (or logfmt) **unbuffered to stdout**. MUST NOT use `tracing-appender` file guards or write `*.log` files ([logging-enforce.md](../../rules/logging-enforce.md)).
- Prometheus metrics on a documented `/metrics` path for the web host.

**Desktop runtime (Tauri 2):**
- Stable Tauri **major 2** only. Known-good floor from the knowledge base snapshot (re-verify at init time; patches may move, the origin-confusion fix MUST remain):
  - Rust `tauri` **>= 2.11.1** (snapshot example: `2.11.5`)
  - `tauri-build` matching the installed `tauri` generation (snapshot example: `2.6.3`)
  - npm `@tauri-apps/api` minor-aligned with Rust `tauri` (snapshot example: `2.11.1`)
  - npm `@tauri-apps/cli` / Rust `tauri-cli` (snapshot example: `2.11.4`)
- Conventional `apps/desktop/src-tauri/` layout: `lib.rs` builder + `main.rs` desktop entry, `build.rs` with `tauri_build::AppManifest` listing **every** application command, `capabilities/`, `permissions/`.
- Frontend imports from `@tauri-apps/api/<module>` (e.g. `core`, `event`, `window`). **Forbidden v1 paths:** `@tauri-apps/api/tauri`, `appWindow`, `tauri.allowlist`, `build.devPath`, `build.distDir`, `tauri.windows`.
- `tauri.conf.json` uses the version-2 schema: windows under `app.windows`, `build.devUrl` + `build.frontendDist` (relative to the config file → `../../frontend/dist`). `app.withGlobalTauri` MUST be `false`.
- Capabilities, permissions, and scopes are the ACL. Custom commands are reachable from local windows unless restricted through `AppManifest` — omitting a command from a capability is **not** a complete ACL. See Step 4.
- Official plugins (`fs`, `shell`, `http`, `sql`, `store`, `updater`, …) are **opt-in**. Do not install the catalog. Each plugin needs crate + JS package (when applicable) + registration + config + capability/scope + tests for allowed **and** denied calls.

**JavaScript UI (shared):**
- Framework-flexible (Vite recommended; Tauri requires a static `frontendDist`). An SSR server is **not** embedded in Tauri; ship a static client build.
- `src/api/` talks to Axum over HTTP. `src/native/` wraps `invoke` for desktop. A thin host adapter selects HTTP vs IPC; do not sprinkle `invoke` through components.
- `@tauri-apps/cli` is a **frontend** devDependency so there is a single `package.json` / lockfile. Desktop does **not** get a second Node project.
- Do not expose arbitrary `VITE_` / `TAURI_` environment prefixes to browser code. No native paths or secrets in frontend build variables.

**Local development:**
- Root `docker-compose.yml`: Postgres (or chosen DB), observability stack (Promtail, Redpanda, Loki, Prometheus, Grafana), and **optionally** the Axum container + frontend static server.
- Web: developers MAY run `cargo run` in `apps/backend` and `npm run dev` in `apps/frontend` against Compose backing services.
- Desktop: `npx tauri dev` (from `apps/frontend`, with CLI `--config` / `--manifest-path` pointing at `apps/desktop/src-tauri`) using the OS webview (WebView2 / WKWebView / WebKitGTK 4.1). Document native prerequisites per OS without Homebrew-only steps ([platform-agnostic.md](../../rules/platform-agnostic.md)).
- Commit `Cargo.lock` for every crate and the frontend lockfile. Use frozen installs in CI (`npm ci`, `cargo --locked`).

---

## Step 4: Tauri Security, IPC, and Host Boundaries

Load [`.agents/kb/tauri-2.md`](../../kb/tauri-2.md) before implementing this step. Apply the knowledge-base **Agent contract** on every desktop change.

**Trust boundary:** Webview inputs, deep links, imported files, and subprocess output are untrusted. Authorization is enforced in Rust, not by hiding UI. Prefer domain operations (“export this document”) over arbitrary “read any path”.

**Init-time ACL (required):**
1. List every `#[tauri::command]` in `src-tauri/build.rs` `AppManifest::commands`.
2. Define application permissions under `src-tauri/permissions/` (no plugin prefix).
3. Grant them only to intended window labels in `src-tauri/capabilities/` (`linux`, `windows`, `macOS`).
4. Set `app.security.capabilities` to the explicit identifier list.
5. Configure a restrictive production CSP (`default-src 'self'`, IPC origins only as required). Use a **separate** `devCsp` for the Vite origin; do not weaken production CSP for HMR.
6. Do not “fix” failures by broadening permissions, disabling CSP/TLS/signature checks, granting remote IPC, enabling production `devtools`, or exposing arbitrary shell/SQL/filesystem proxies.

**IPC rules:**
- Request/response: small owned inputs, typed Serde DTOs (`camelCase` JS keys by default), explicit `Result<T, E>` errors.
- Long work: IDs, status, cancellation, bounded queues; blocking/CPU work on blocking workers — `async fn` is not non-blocking.
- Managed state: `Send + Sync + 'static`, exact `State<'_, T>` type, no mutex guard across `.await`.
- `std::fs`, a custom `reqwest` client, and `std::process::Command` do **not** inherit plugin scopes. Custom commands MUST validate paths/URLs/ids themselves.

**Logging on desktop:** If `tauri-plugin-log` is used, configure it to stdout (and optional tracing) only. MUST NOT add a file target.

**Shipping vs test:** Embedded WebDriver / `tauri-plugin-wdio-webdriver` / extra `devtools` belong behind a test-only Cargo feature. Shipping builds MUST NOT register them.

---

## Step 5: Populate `apps/README.md`

Create or replace `apps/README.md` so it describes **this** stack (not FastAPI/Phoenix/WordPress). Use the following text, adjusted only if app directory names change:

The best practice for a Rust/JavaScript product is a monorepo of **independent apps** under `apps/`. Domain logic lives in a shared Rust crate. Two hosts consume it: an Axum HTTP server (web) and a Tauri 2 process (desktop). One JavaScript/TypeScript UI talks HTTP in the browser and typed IPC inside the desktop webview. The repository root stays language-agnostic: no `Cargo.toml` or `package.json` at the root.

```text
project-root/
├── docker-compose.yml       # Web host (optional), databases, observability
├── .env
├── apps/
│   ├── README.md
│   ├── core/                # Shared Rust domain crate
│   ├── backend/             # Axum web host
│   ├── frontend/            # JavaScript/TypeScript UI
│   └── desktop/             # Tauri 2 native host (src-tauri/)
└── README.md
```

When writing or configuring code for this stack, you must adhere to the following principles:

**Complete separation of hosts:** The browser never calls Tauri `invoke`. The desktop webview does not need the Axum process for privileged local work. Shared behaviour belongs in `apps/core`.

**`apps/core`:** Domain types, validation, and use-cases. No HTTP server, no Tauri, no frontend imports.

**The web host (`apps/backend`):** Axum adapters, auth at the HTTP boundary, SQLx, `/metrics`, stdout tracing. Dockerfile lives here.

**The desktop host (`apps/desktop/src-tauri`):** Typed commands, capabilities, native windows/menus. System webviews; no Electron/Node runtime in the installed app.

**The JavaScript UI (`apps/frontend`):** `src/api/` for HTTP, `src/native/` for IPC, `components/` for views. Tests live under this app’s `tests/`.

**Docker:** Root `docker-compose.yml` runs backing services, observability, and optionally the web containers. Tauri is not a Compose service.

**Isolated testing:** All caches and Allure output MUST stay under each app’s `tests/` directory ([artifact-isolation.md](../../rules/artifact-isolation.md)). Cargo `target/` is gitignored per crate, never at the repo root as a shared dump.

**Testing taxonomy:** `unit/`, `integration/`, `ui/`, BDD `features/`, `e2e/`, `performance/`, `allure-results/`.

**Centralized logging:** Unbuffered stdout only. Promtail → Redpanda → Loki, Prometheus, Grafana via Compose.

---

## Step 6: Configure Testing Frameworks

Mirror the Python/JS taxonomy with Rust-native tools on the hosts and JS tools on the UI.

### 1. Rust (`apps/core`, `apps/backend`, `apps/desktop/src-tauri`)
- **`cargo test`** (and optionally **cargo-nextest**) for unit tests under each crate’s `tests/unit/` and `#[cfg(test)]` modules. Configure `[[test]]` targets so Cargo does not assume a flat `tests/*.rs` only. Desktop Cargo tests live in `apps/desktop/src-tauri/tests/` (the crate root), not `apps/desktop/tests/`.
- **Integration:** Axum tests via `oneshot` / `TestClient` against `apps/backend/tests/integration/`, with Compose (or testcontainers) for real Postgres when the code talks to a database. Tauri command tests cover DTO casing, validation, and error shapes; they do **not** prove capability enforcement by themselves.
- **BDD:** [`cucumber`](https://crates.io/crates/cucumber) (Rust) executing Gherkin under `tests/features/`. Do not add a second Gherkin runner for the same flow.
- **Performance:** **Criterion** benches under `tests/performance/` (explicit `[[bench]]` paths). HTTP load MAY use **k6** against the Axum service; do not require Locust.
- **ACL tests (desktop):** Real Tauri integration tests for allowed main-window invocation **and** denial from an ungranted view. Negative permission/scope tests are mandatory whenever a plugin or custom command is added.
- **Native E2E (desktop):** WebdriverIO **embedded** driver (`@wdio/tauri-service`, `driverProvider: 'embedded'`) under `apps/desktop/tests/e2e/`, covering Windows, Linux, and macOS. Do not claim the standalone `tauri-driver` supports macOS WKWebView. Keep WebDriver behind a test-only Cargo feature.
- Output JUnit XML (nextest `--junit` or equivalent) into that crate’s `tests/allure-results/`. Purge the folder before each run.

### 2. JavaScript (`apps/frontend`)
- **Vitest** or **Jest** for `tests/unit`.
- **Testing Library** (jsdom) for `tests/ui`. Mock Tauri with `@tauri-apps/api/mocks` (`mockIPC`, window mocks, `clearMocks` between tests). Mocks do **not** prove native permissions or packaging.
- **Playwright** for `tests/e2e` against the **built** frontend (`npm run build` + preview or the Axum static mount), not only the Vite dev server, to satisfy the UI Test Mandate (no hydration/SSR errors).
- **Cucumber.js** MAY drive Playwright for UI Gherkin, or Rust cucumber may call the same URLs. Prefer **one** Gherkin runner per flow.
- Browser Playwright is not proof of Windows/Linux/macOS webview behaviour.

### 3. Global test reporting: Allure
- Rust: JUnit XML → `apps/<crate>/tests/allure-results`.
- Playwright: `allure-playwright`, same folder per app (`apps/frontend/tests/allure-results`).
- Purge `tests/allure-results` before each run (`pretest` hook or a cargo alias).
- Serve with Allure CLI from that folder. Never write Allure to the repo root.

### 4. Linting and static analysis
- **`cargo fmt`** and **`cargo clippy --all-targets --locked -- -D warnings`** inside each Rust crate.
- **`cargo deny`** and/or **`cargo audit`** in CI (documented in the lint ADR).
- **ESLint** and **Prettier** inside `apps/frontend`.

### Best practices
- Lint and format **inside** `apps/core`, `apps/backend`, `apps/desktop/src-tauri`, and `apps/frontend` before tests ([command-verification.md](../../rules/command-verification.md)).
- TDD: tests first ([tdd-enforce.md](../../rules/tdd-enforce.md)). Walkthrough files go under `apps/<app>/resources/tasks/`.
- `npx playwright install` is required once per developer machine; document it in the root README.
- `cargo build` alone does not run the frontend or Tauri bundler. Document `npx tauri build` separately. A successful macOS run does not establish Windows/Linux support.

---

## Step 7: Configure Documentation Generation

1. **Rust:** `///` and `//!` rustdoc on all public modules, types, and functions. Generate HTML with `cargo doc --no-deps` inside each crate. Public items MUST be rustdoc-parseable (no missing docs on public API; clippy `missing_docs` MAY be enabled per ADR).
2. **JavaScript:** JSDoc on all functions in `apps/frontend/src`. The frontend `package.json` MUST include `"docs": "jsdoc -c jsdoc.json"` with `jsdoc.json` limited to that app’s `src/`.

---

## Step 8: Generate Inline Documentation Rule

Create or **replace** `.agents/rules/docs-enforce.md` with this content (this stack is Rust + JS, not Python, Elixir, or PHP):

```markdown
---
description: Ensure all code is comprehensively documented using rustdoc and JSDoc.
---

# Inline Documentation Enforcement

**Purpose:** This rule dictates how an AI agent MUST document the codebase to satisfy the Inline Documentation Mandate in `AGENTS.md`.

## Active Enforcement

Before declaring any coding task "complete" or writing tests, the agent MUST verify that the following components include verbose inline documentation that clearly explains their function and intended usage:

1.  **ALL** Modules / crates
2.  **ALL** Public types (structs, enums, traits)
3.  **ALL** Public functions / methods
4.  **ALL** Complex or non-obvious code blocks

### Rust (`apps/core`, `apps/backend`, `apps/desktop/src-tauri`)
The agent MUST use rustdoc (`///` on items, `//!` on modules) on all public modules, types, and functions. These comments MUST be parseable by `cargo doc`.

### Javascript/TypeScript (`apps/frontend`)
The agent MUST use standard `JSDoc` syntax (`/** ... */`) for all frontend logic, HTTP clients, Tauri invoke wrappers, hooks, and utilities.

*Failure to document code according to these standards violates the core AGENTS.md manifesto.*
```

---

## Step 9: Generate Linting Rule

Create or **replace** `.agents/rules/lint-enforce.md` with this content. After you write the linting ADR, set the ADR filename in the “Based on” line to the real path (do not leave a Python Ruff ADR reference).

```markdown
---
description: Ensure all code is strictly linted and formatted before pushing or testing.
---

# Linting and Formatting Enforcement

**Purpose:** This file instructs the AI agent on exactly how to lint and format the codebase to satisfy the Test-Driven Development (TDD) linting mandate in `AGENTS.md`.

## Active Tools

Based on the accepted Architecture Decision Records in `resources/architecture/ADRs/` for coding style:

- **rustfmt** (`cargo fmt`) for Rust formatting.
- **Clippy** (`cargo clippy -D warnings`) for Rust static analysis.
- **ESLint** for JavaScript static analysis.
- **Prettier** for JavaScript (and CSS) formatting.

## Execution Requirements

Before running any tests, committing code, or completing an execution task, you MUST execute the following CLI commands inside the correct workspace.

### 1. Format the frontend
```bash
cd apps/frontend/
npx prettier --write .
```

### 2. Lint the frontend (and auto-fix)
```bash
cd apps/frontend/
npx eslint . --fix
```

### 3. Format and lint each Rust crate
```bash
cd apps/core/
cargo fmt
cargo clippy --all-targets --locked -- -D warnings
```
Repeat for `apps/backend/` and `apps/desktop/src-tauri/`.

## Agent Resolution Mandate

If `eslint` or `cargo clippy` return a non-zero exit code, the agent **MUST NOT** proceed to testing or committing.

The agent MUST:

1. Review the CLI output.
2. Fix the violations.
3. Rerun the same commands until they exit 0.

Only when rustfmt, Clippy, Prettier, and ESLint all exit cleanly is the codebase valid for testing or PR submission.
```

---

## Step 10: Generate Architecture Decision Records

Use [adr-formatting.md](../../rules/adr-formatting.md). Write ADRs to `resources/architecture/ADRs/`. Be sure to include separate ADRs specifically for:

1. Test runners and reporting (cargo test/nextest, cucumber, Criterion, Playwright, WebdriverIO embedded driver, Allure).
2. Inline docs generators (`cargo doc`, JSDoc).
3. Coding style and linting (rustfmt, Clippy, ESLint, Prettier, cargo-deny/audit).
4. Web host: Axum + Tokio + SQLx (or the chosen store) and stdout `tracing`.
5. Desktop host: stable Tauri major 2, capability/permission model, shared `apps/frontend` static UI.
6. Shared `apps/core` crate versus duplicating domain in each host.
7. The centralized observability stack (Loki, Redpanda, Promtail, Prometheus, Grafana) and the split between containerized web logs and native desktop stdout.
8. Distribution: web container/binary versus Tauri installers (NSIS/MSI, dmg/app, AppImage/deb/rpm), signing, and whether the updater plugin is in scope.

Verify current crate/npm names and versions before writing ADRs ([command-verification.md](../../rules/command-verification.md), [dependency-management.md](../../rules/dependency-management.md)). Search `resources/architecture/ADRs/` before claiming an ADR does not exist ([adr-verification.md](../../rules/adr-verification.md)).

---

## Step 11: Configure Global `.gitignore`

The root `.gitignore` already exists. You MUST **append** (not overwrite) the following if not already present:

```text
# Rust build
**/target/

# Test reports & artifacts
**/artifacts/
**/playwright-report/
**/allure-results/
**/coverage/
**/wdio-logs/

# Dependency directories
node_modules/
**/node_modules/

# Scratch files and transient tests
**/test-card.js
**/screenshot.spec.js

# Allow selective tracking in tests/
**/tests/*
!**/tests/features/
!**/tests/support/
!**/tests/unit/
!**/tests/ui/
!**/tests/e2e/
!**/tests/integration/
!**/tests/performance/
!**/tests/README.md
```

---

## Step 12: Configure Observability (Compose)

If `config/loki/local-config.yaml`, `config/promtail/docker-config.yaml`, and `config/prometheus/prometheus.yml` already exist, **update** them to scrape the Axum container (and any other web services); do not blindly overwrite working files.

1. Loki: local filesystem, `auth_enabled: false`.
2. Promtail: Docker/container stdout → Loki. Desktop processes are **not** in Docker; document that local `cargo tauri` / `cargo run` stdout is attached in the developer terminal unless a sidecar is added later.
3. Prometheus: scrape itself, Loki, Redpanda, and the Axum `/metrics` endpoint.
4. Volume-mount these files read-only in `docker-compose.yml`.

Application code still MUST NOT write log files.

---

## Step 13: Update Documentation

1. **Insert** platform-agnostic Rust, Node, and Tauri native-prereq instructions at the top of the root `README.md` (official rustup, Node version managers such as `asdf` or `mise`, and Tauri’s OS prerequisite pages for MSVC/WebView2, Xcode CLT, WebKitGTK 4.1 — **no Homebrew-only steps**). **MUST NOT** delete existing README content.
2. **Update** `## Run tests` with commands run **inside** each app directory: `cargo fmt`, `cargo clippy`, `cargo test`, frontend lint/test/Playwright, Allure serve paths, `npx playwright install`, and (when desktop is in scope) the WebdriverIO/Tauri command. **MUST NOT** delete unrelated README content.
3. **Update** `## View logs` under Setup Development Environment: how to start Compose observability and open Grafana. State clearly that this scrapes **container** stdout (web). Desktop logs are process stdout.
4. **Update** `## Run the application`:
   - Web: Compose (if used), `cargo run` in `apps/backend`, `npm run dev` in `apps/frontend`, documented URL/port.
   - Desktop: native prerequisites, `npx tauri dev` from `apps/frontend` targeting `apps/desktop/src-tauri`, and that a packaged `npx tauri build` is required before claiming a release artifact.

Verify every documented command actually runs ([command-verification.md](../../rules/command-verification.md)). Report exactly which OS/arch checks ran; never claim compilation, notarization, or platform testing that did not occur.

---

## Success criteria

- [ ] `apps/core`, `apps/backend`, `apps/frontend`, and `apps/desktop/src-tauri` exist; no root `Cargo.toml` / `package.json`.
- [ ] Domain logic is in `apps/core`; Axum and Tauri depend on it; the frontend does not reimplement privileged operations.
- [ ] `resources/srs.md` exists per app with PRD parent links.
- [ ] Test folders match the taxonomy; Allure output is under each app `tests/`.
- [ ] `docs-enforce.md` and `lint-enforce.md` describe rustdoc/rustfmt/Clippy/JS, not Ruff, Mix, or PHPCS.
- [ ] ADRs exist for test, docs, lint, Axum, Tauri 2, `apps/core`, observability, and distribution, and they do not contradict earlier accepted ADRs.
- [ ] Tauri stays on stable major 2; `AppManifest`, capabilities, production CSP, and `frontendDist` are configured; no v1 allowlist/`devPath` APIs.
- [ ] Root README explains rustup/Node/Tauri prerequisites, web vs desktop run/test/log paths, without erasing About this project.
- [ ] Relative links only; no absolute developer machine paths.
- [ ] Compose does not containerize the Tauri host.
