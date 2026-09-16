---
name: PHP/WordPress Plugin Initialization
description: Initialize a PHP and JavaScript WordPress plugin monorepo (C2PApress Audit + Pro) with apps/ isolation, Docker WordPress, PHPUnit, Playwright, Allure, and the observability compose stack.
allowed-tools:
  - code_interpreter
references:
  - resources/prd.md
---

# PHP / WordPress Plugin Project Initialization

This skill guides the AI agent to initialize a **PHP + JavaScript WordPress plugin** monorepo. It is the C2PApress equivalent of the Python/JS and BEAM/Elixir init skills.

**When to use:** The user asks to initialize C2PApress, scaffold the plugins, or run this skill. **Do not** run [init-python-js](../init-python-js/SKILL-init-python-js.md) or [init-beam-elixir](../init-beam-elixir/SKILL-init-beam-elixir.md) for this product ([ADR 009](../../../resources/architecture/009-open-agent-dev-stack.md)).

**Hard constraints (already accepted):**
- Photo work runs **on the merchant’s WordPress** ([ADR 001](../../../resources/architecture/001-run-on-merchant-wordpress.md)).
- Two distributions: free **Audit** on WordPress.org, paid **Pro** off-directory ([ADR 002](../../../resources/architecture/002-two-plugin-distributions.md)).
- PHP + WP-packaged JS; WordPress database ([ADR 003](../../../resources/architecture/003-php-js-and-wp-datastore.md)).
- Plugin logging is WordPress/PHP stdout on the **customer** host ([ADR 008](../../../resources/architecture/008-wordpress-native-logging.md)). The **local** Docker Compose stack MAY still scrape container stdout into Loki.

Keep every file and folder already in the repository root. Do not delete product-vision, PRD, ADRs, or `.agents/`.

---

## Step 1: Scaffold the Root Directory Structure

When reviewing `.agents/rules/workspace-boundaries.md`, you will see only Python/JS and BEAM examples. You MUST treat this project as a **polyglot monorepo** whose deployable apps are **WordPress plugins** inside `apps/`. Language manifests (`composer.json`, `package.json`, `phpunit.xml.dist`) MUST live **inside each app**, never at the repository root.

```text
project-root/
├── docker-compose.yml
├── .env
├── config/
│   ├── loki/
│   ├── promtail/
│   └── prometheus/
├── apps/
│   ├── README.md
│   ├── c2papress-shared/          # Optional Composer path library (not a WP.org zip)
│   ├── c2papress-audit/           # Free plugin (WordPress.org)
│   │   ├── c2papress-audit.php
│   │   ├── readme.txt
│   │   ├── composer.json
│   │   ├── phpunit.xml.dist
│   │   ├── phpcs.xml.dist
│   │   ├── package.json
│   │   ├── src/
│   │   ├── assets/
│   │   │   ├── js/
│   │   │   └── css/
│   │   ├── tests/
│   │   │   ├── unit/
│   │   │   ├── integration/
│   │   │   ├── ui/
│   │   │   ├── e2e/
│   │   │   ├── features/
│   │   │   ├── performance/
│   │   │   ├── support/
│   │   │   └── allure-results/
│   │   └── resources/
│   │       └── srs.md
│   └── c2papress-pro/             # Paid plugin (not shipped on WordPress.org)
│       ├── c2papress-pro.php
│       ├── composer.json
│       ├── phpunit.xml.dist
│       ├── phpcs.xml.dist
│       ├── package.json
│       ├── src/
│       ├── assets/
│       ├── tests/
│       │   ├── unit/
│       │   ├── integration/
│       │   ├── ui/
│       │   ├── e2e/
│       │   ├── features/
│       │   ├── performance/
│       │   ├── support/
│       │   └── allure-results/
│       └── resources/
│           └── srs.md
└── README.md
```

**DO NOT** generate `apps/frontend` + `apps/backend` (FastAPI/SPA) or Phoenix OTP apps. **DO NOT** place `composer.json` or `package.json` at the repository root.

**Ports:** When adding Compose services, scan existing published ports and increment by +1 so WordPress, MySQL, Grafana, and Playwright never clash ([port-conflicts](../../rules/port-conflicts.md)). Document the chosen WordPress HTTP port in `docker-compose.yml` and root README.

**Shared library:** `apps/c2papress-shared` MAY hold Composer-shared PHP. Each **shippable zip** MUST be self-contained (copy or vendor the shared code). WordPress.org MUST NOT depend on a sibling path package at runtime.

**License:** Plugin headers MUST be GPL-compatible (`GPL-2.0-or-later` recommended). Audit `readme.txt` MUST follow WordPress.org readme conventions. Pro MUST declare `Requires Plugins: woocommerce` for product-page features. Audit MUST run without WooCommerce.

---

## Step 2: Enforce Documentation Traceability & Sync

Same monorepo requirements method as the BEAM init skill, with PRD at `resources/prd.md` (this repo does not use root `prd.md`).

1. **Global source of truth:** [`resources/prd.md`](../../../resources/prd.md) and [`resources/product-vision.md`](../../../resources/product-vision.md).
2. **Localized specs:** Each plugin app MUST have `resources/srs.md` bounded to that plugin (Audit vs Pro).
3. **Traceability metadata** at the top of each `srs.md`:
   ```yaml
   ---
   title: "C2PApress Audit Software Requirements Specification"
   parent: "../../../resources/prd.md"
   ---
   ```
4. **Line-by-line traceability:** Every SRS requirement MUST link to its parent in `resources/prd.md` with a relative markdown link (e.g. `[PRD F-001](../../../resources/prd.md#f-001-inspect-uploads-before-thumbnails)`).
5. **Sync:** Follow [sync-logic.md](../../rules/sync-logic.md). Plugin SRS changes that affect shared behaviour MUST update the root PRD and the sibling plugin SRS.

---

## Step 3: Enforce Technical Stack

You MUST configure the following. Do not add FastAPI, Phoenix, Oban, libcluster, or a vendor photo API.

**WordPress runtime (production):**
- PHP 8.1 or newer unless a later ADR raises the floor for the C2PA engine ([ADR 004](../../../resources/architecture/004-c2pa-validate-on-host.md)).
- WordPress plugin bootstrap in the main PHP file (headers, `ABSPATH` guard, autoload).
- Namespaced PHP under `src/` (PSR-4 via Composer).
- Admin and product-page JavaScript under `assets/js/`, built or copied as WordPress enqueues — not a separate SPA talking to a Python API.

**Local development (Docker Compose at repo root):**
- `wordpress` service with both plugins mounted into `wp-content/plugins/`.
- `mysql` (or MariaDB) for WordPress.
- WooCommerce installed in the **Pro / integration** profile; Audit-only tests MUST be runnable without WooCommerce.
- Optional Mailpit/Mailhog for license-email tests.
- Observability stack: Promtail, Redpanda, Loki, Prometheus, Grafana — scraping **container stdout** of the local WordPress PHP service. This stack is for developers. It MUST NOT be bundled into the plugin zips ([ADR 008](../../../resources/architecture/008-wordpress-native-logging.md)).

**C2PA:** Validate on the host. Do not require `exec` or a PHP extension for Audit. Pro re-sign is optional until a follow-up engine ADR.

**Logging in plugin code:** Unbuffered PHP/`error_log` so php-fpm/Apache stdout can be scraped in Compose. MUST NOT open vendor log files on disk ([logging-enforce.md](../../rules/logging-enforce.md), [ADR 008](../../../resources/architecture/008-wordpress-native-logging.md)).

---

## Step 4: Populate `apps/README.md`

Create or replace `apps/README.md` so it describes **this** stack (not FastAPI/Phoenix). Use the following text, adjusted only if plugin slugs change:

The best practice for C2PApress is a monorepo of **WordPress plugins** under `apps/`. Each plugin is a standalone, zip-ready project with its own `composer.json`, `package.json`, tests, and `resources/srs.md`. The repository root stays language-agnostic: no `composer.json` or `package.json` at the root.

```text
project-root/
├── docker-compose.yml       # WordPress, database, observability
├── .env
├── apps/
│   ├── README.md
│   ├── c2papress-shared/    # Optional shared PHP (copied into zips)
│   ├── c2papress-audit/     # Free WordPress.org plugin
│   └── c2papress-pro/       # Paid add-on (WooCommerce product pages)
└── README.md
```

**Complete separation of deployables:** Audit and Pro are two plugins. They MAY share PHP via `c2papress-shared`, but each zip MUST run on WordPress alone.

**The PHP plugin:** Domain logic lives in `src/` (inspect, strip, preserve, disclose). WordPress bootstrap stays in the main plugin file. WooCommerce-specific code belongs in Pro.

**The JavaScript:** Enqueued assets for wp-admin and product pages. Tests for JS live under that plugin’s `tests/`. JS MUST NOT assume a Python or Elixir backend.

**Docker:** Root `docker-compose.yml` runs WordPress and the log stack. Plugins are bind-mounted; they are not the Compose “app image” in production.

**Isolated testing:** All caches and Allure output MUST stay under each app’s `tests/` directory ([artifact-isolation.md](../../rules/artifact-isolation.md)).

**Testing taxonomy:** `unit/`, `integration/`, `ui/`, BDD `features/`, `e2e/`, `performance/`, `allure-results/`.

---

## Step 5: Configure Testing Frameworks

Mirror the Python/JS taxonomy with WordPress-native tools.

### 1. PHP (plugin “backend”)
- **PHPUnit** with WordPress test stubs or `yoast/wp-test-utils` / `wp-phpunit` for unit and integration tests under `tests/unit/` and `tests/integration/`.
- **Behat** for Gherkin under `tests/features/` (PHP equivalent of behave).
- Integration tests that need WordPress MUST boot against the Compose (or wp-env) instance, not a hidden global `/tmp` WordPress.
- **k6** or a PHP load script MAY live in `tests/performance/` for bulk-clean caps (PRD F-011). Do not require Locust.

### 2. JavaScript (admin / product-page UI)
- **Vitest** or **Jest** for `tests/unit` of `assets/js`.
- **Testing Library** (jsdom) for `tests/ui`.
- **Playwright** for `tests/e2e` against the Compose WordPress URL (wp-admin, Media Library, Woo product page). UI tests MUST run against the **built** plugin assets, not a detached Vite-only page, to satisfy the UI Test Mandate (no hydration/SSR errors on wp-admin).
- **Cucumber.js** MAY drive Playwright for `tests/features` that describe UI in Gherkin, or Behat may call the same WordPress URL. Prefer **one** Gherkin runner per flow to avoid duplicate scenarios.

### 3. WordPress.org Plugin Check
- Run **Plugin Check (PCP)** against `c2papress-audit` in CI and locally. Audit MUST pass directory-oriented checks (no trialware, no phone-home).

### 4. Global test reporting: Allure
- PHPUnit: Allure PHPUnit adapter, output **only** to `apps/<plugin>/tests/allure-results`.
- Playwright: `allure-playwright`, same folder per app.
- Purge `tests/allure-results` before each run (PHPUnit bootstrap or npm `pretest`).
- Serve with Allure CLI from that folder. Never write Allure to the repo root.

### 5. Linting
- **PHP_CodeSniffer** with **WordPress Coding Standards** (`phpcs.xml.dist` inside each plugin). Auto-fix via `phpcbf`.
- **PHPStan** or **Psalm** at a documented level (start at a low level; do not block init on level 9).
- **ESLint** and **Prettier** inside each plugin that has `package.json`.

### Best practices
- Lint and format **inside** `apps/c2papress-audit` and `apps/c2papress-pro` before tests ([command-verification.md](../../rules/command-verification.md)).
- TDD: tests first ([tdd-enforce.md](../../rules/tdd-enforce.md)). Walkthrough files go under `apps/<plugin>/resources/tasks/`.
- `npx playwright install` is required once per developer machine; document it in the root README.

---

## Step 6: Configure Documentation Generation

1. **PHP:** PHPDoc on all classes, functions, and modules. Generate HTML with `phpDocumentor` (Composer `--dev` in each plugin, or one documented command per app). Docblocks MUST be parseable by phpDocumentor.
2. **JavaScript:** JSDoc on all functions in `assets/js`. Each plugin `package.json` MUST include `"docs": "jsdoc -c jsdoc.json"` with `jsdoc.json` limited to that plugin’s assets.

---

## Step 7: Generate Inline Documentation Rule

Create or **replace** `.agents/rules/docs-enforce.md` with this content (this stack is PHP + JS, not Python or Elixir):

```markdown
---
description: Ensure all code is comprehensively documented using PHPDoc and JSDoc.
---

# Inline Documentation Enforcement

**Purpose:** This rule dictates how an AI agent MUST document the codebase to satisfy the Inline Documentation Mandate in `AGENTS.md`.

## Active Enforcement

Before declaring any coding task "complete" or writing tests, the agent MUST verify that the following components include verbose inline documentation that clearly explains their function and intended usage:

1.  **ALL** Classes
2.  **ALL** Functions / Methods
3.  **ALL** Modules
4.  **ALL** Complex or non-obvious code blocks

### PHP (WordPress plugins)
The agent MUST use PHPDoc (`/** ... */`) on all classes, methods, hooks, and non-trivial functions. These comments MUST be parseable by phpDocumentor.

### Javascript (wp-admin and storefront assets)
The agent MUST use standard `JSDoc` syntax (`/** ... */`) for all frontend logic, WordPress-enqueued scripts, and utilities.

*Failure to document code according to these standards violates the core AGENTS.md manifesto.*
```

---

## Step 8: Generate Linting Rule

Create or **replace** `.agents/rules/lint-enforce.md` with this content. After you write the linting ADR, set the ADR filename in the “Based on” line to the real path (do not leave a Python Ruff ADR reference).

```markdown
---
description: Ensure all code is strictly linted and formatted before pushing or testing.
---

# Linting and Formatting Enforcement

**Purpose:** This file instructs the AI agent on exactly how to lint and format the codebase to satisfy the Test-Driven Development (TDD) linting mandate in `AGENTS.md`.

## Active Tools

Based on the accepted Architecture Decision Records in `resources/architecture/` for coding style:

- **PHP_CodeSniffer (WordPress Coding Standards)** and **phpcbf** for PHP.
- **ESLint** for JavaScript static analysis.
- **Prettier** for JavaScript (and CSS) formatting.

## Execution Requirements

Before running any tests, committing code, or completing an execution task, you MUST execute the following CLI commands inside the correct plugin workspace.

### 1. Format plugin JavaScript
```bash
cd apps/c2papress-audit/
npx prettier --write .
```
Repeat for `apps/c2papress-pro/` if that tree changed.

### 2. Lint plugin JavaScript (and auto-fix)
```bash
cd apps/c2papress-audit/
npx eslint . --fix
```
Repeat for Pro if needed.

### 3. Lint and format PHP (and auto-fix)
```bash
cd apps/c2papress-audit/
vendor/bin/phpcbf
vendor/bin/phpcs
```
Repeat for `apps/c2papress-pro/`.

## Agent Resolution Mandate

If `eslint` or `phpcs` return a non-zero exit code, the agent **MUST NOT** proceed to testing or committing.

The agent MUST:

1. Review the CLI output.
2. Fix the violations.
3. Rerun the same commands until they exit 0.

Only when PHPCS, Prettier, and ESLint all exit cleanly is the codebase valid for testing or PR submission.
```

---

## Step 9: Generate Architecture Decision Records

Use [adr-formatting.md](../../rules/adr-formatting.md). **Do not duplicate** ADRs 001–009. Add **new** consecutive ADRs for:

1. Test runners and reporting (PHPUnit, Behat, Playwright, Allure, Plugin Check).
2. Inline docs generators (phpDocumentor, JSDoc).
3. Coding style and linting (PHPCS/WPCS, ESLint, Prettier, PHPStan/Psalm).
4. Local Compose observability stack (Loki, Redpanda, Promtail, Prometheus, Grafana) **and** the explicit split vs [ADR 008](../../../resources/architecture/008-wordpress-native-logging.md) (local containers vs plugin on a customer host).

If 001–009 are missing, stop and tell the user; do not invent a FastAPI/Phoenix stack.

---

## Step 10: Configure Global `.gitignore`

The root `.gitignore` already exists. You MUST **append** (not overwrite) the following if not already present:

```text
# Test reports & artifacts
**/artifacts/
**/playwright-report/
**/allure-results/
**/coverage/
**/.phpunit.cache/
**/.phpunit.result.cache

# Dependency directories
node_modules/
**/node_modules/
vendor/
**/vendor/

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

## Step 11: Configure Observability (local Compose only)

If `config/loki/local-config.yaml`, `config/promtail/docker-config.yaml`, and `config/prometheus/prometheus.yml` already exist, **update** them to scrape the WordPress/PHP container; do not blindly overwrite working files.

1. Loki: local filesystem, `auth_enabled: false`.
2. Promtail: Docker/container stdout → Loki.
3. Prometheus: scrape itself, Loki, Redpanda, and any WordPress metrics endpoint you add.
4. Volume-mount these files read-only in `docker-compose.yml`.

Plugin code still MUST NOT write log files ([ADR 008](../../../resources/architecture/008-wordpress-native-logging.md)).

---

## Step 12: Update Documentation

1. **Insert** platform-agnostic PHP, Composer, and Node install instructions at the top of the root `README.md` (official php.net / getcomposer.org / Node version managers such as `asdf` or `mise` — **no Homebrew-only steps**). **MUST NOT** delete existing README content.
2. **Update** `## Run tests` with commands run **inside** each plugin directory: `phpcs`, `phpunit`, Behat, Playwright, Plugin Check, Allure serve paths, and `npx playwright install`. **MUST NOT** delete unrelated README content.
3. **Update** `## View logs` under Setup Development Environment: how to start Compose observability and open Grafana. State clearly that this is **local Docker**, not something merchants install.
4. **Update** `## Run the application`: how to `docker compose up` WordPress, the plugin mount path, and the WordPress URL/port.

Verify every documented command actually runs ([command-verification.md](../../rules/command-verification.md)).

---

## Success criteria

- [ ] `apps/c2papress-audit` and `apps/c2papress-pro` exist as zip-shaped plugins; no root `composer.json` / `package.json`.
- [ ] Audit has no Pro code and no license HTTP client.
- [ ] `resources/srs.md` exists per plugin with PRD parent links.
- [ ] Test folders match the taxonomy; Allure output is under each app `tests/`.
- [ ] `docs-enforce.md` and `lint-enforce.md` describe PHPDoc/PHPCS/JS, not Ruff or Mix.
- [ ] New ADRs for test, docs, lint, and local observability exist and do not contradict 001–009.
- [ ] Root README explains PHP/Node setup, tests, logs, and local WordPress without erasing About this project.
- [ ] Relative links only; no absolute developer machine paths.
