---
type: Reference
title: BEAM / Elixir / Phoenix stack reference
description: Baseline libraries, project layout, testing, quality, release, clustering, and observability conventions for projects built on the BEAM with Elixir and Phoenix, plus optional components to add only when the PRD or ADRs require them.
resource: https://hexdocs.pm/elixir/
tags:
- beam
- elixir
- phoenix
- otp
- ecto
- oban
- stack-reference
status: stable
generated:
  by: process:kb-synthesizer
  at: '2026-10-16T00:00:00Z'
sources:
- id: elixir-docs
  resource: https://hexdocs.pm/elixir/
  title: Elixir documentation
- id: phoenix-docs
  resource: https://hexdocs.pm/phoenix/
  title: Phoenix documentation
kb-title: BEAM / Elixir / Phoenix stack reference
source-url: https://hexdocs.pm/elixir/
spec-version: '0.2'
last-updated: '2026-10-16T00:00:00Z'
domain: Software Architecture, BEAM, Elixir, Phoenix
copyright: Pieter Van Garderen (2026)
license: MIT
---

# BEAM / Elixir / Phoenix Stack Reference

**Purpose:** A generic reference for agents scaffolding or extending a project on the BEAM with Elixir and Phoenix. It describes a sensible baseline. The project's PRD and Architecture Decision Records (ADRs) in `resources/architecture/ADRs/` always take precedence over this file.

# Baseline Stack

## Web & Real-time UX
* **Phoenix:** The web framework. Serves HTTP endpoints, JSON APIs, and static assets.
* **Phoenix LiveView:** Server-rendered, stateful UI over WebSockets. The server pushes DOM diffs, so real-time updates (progress, notifications, live data) need no page refresh.
    * **LiveView Streams:** Manage large or growing collections in the browser (feeds, logs, chat history) by sending only the changed items over the wire.
    * **Hooks (JS interop):** Small client-side hooks for behaviour LiveView cannot express on its own (e.g. keeping a scroll container pinned to the latest item).
    * **`handle_async` / `start_async`:** Run slow work without blocking the LiveView process, so the UI stays responsive.
    * **`allow_upload/3`:** Native file uploads with progress tracking. Can stream directly to S3-compatible object storage (e.g. via `ex_aws_s3`) when an ADR selects it.
* **Phoenix.PubSub:** Broadcasts messages between processes and nodes (e.g. "job complete" events pushed to connected LiveViews).

## Storage & Data Persistence
* **Ecto + PostgreSQL:** Ecto provides schemas, changesets, migrations, and a composable query DSL. PostgreSQL is the primary data store.
* **Object storage (per ADR):** Large unstructured files (images, PDFs, exports) belong in S3-compatible object storage rather than the database.

## Background Processing
* **Oban:** PostgreSQL-backed job processing. Jobs survive node restarts, support retries with backoff, scheduling, uniqueness, and per-queue concurrency limits. Oban workers MUST be idempotent because a job may run more than once.
* **Broadway (optional):** For high-volume ingestion from message brokers (e.g. SQS, RabbitMQ, Kafka) with batching and back-pressure.

## OTP Supervision
* Structure every long-lived process under a supervision tree. Prefer `Task.Supervisor`, `DynamicSupervisor`, and `PartitionSupervisor` over unsupervised `spawn`.
* Bound concurrency explicitly (pool sizes, Oban queue limits, `PartitionSupervisor` partitions) so the system never starts more parallel work than the host can handle.
* Let processes crash and be restarted by their supervisor rather than wrapping everything in defensive rescue blocks, but every error MUST still be logged, raised, or returned (see `AGENTS.md`).

## Quality Assurance & Static Analysis
* **`mix format`:** Mandatory code formatting. Run with `--check-formatted` in CI.
* **Credo:** Style and consistency linting.
* **Dialyzer (via `dialyxir`):** Success-typing analysis that catches type mismatches. Add `@spec` to public functions.
* **Sobelow:** Security scanner for Phoenix (e.g. SQL injection, XSS, insecure configuration).
* **Boundary (optional):** Enforces explicit dependencies between contexts so one context (e.g. `Ordering`) cannot reach into another's internals (e.g. `Billing`).

## Testing
* **ExUnit:** Native unit and integration testing. Use `Ecto.Adapters.SQL.Sandbox` for concurrent, isolated database tests.
* **Phoenix.LiveViewTest / PhoenixTest:** Simulate clicks and form submissions against LiveViews and controllers without a browser.
* **Wallaby (or Playwright, per ADR):** Browser automation for end-to-end and UI tests against a built release.
* **Test reporting (per ADR):** e.g. Allure or JUnit XML formatters, so results feed the structured reporting required by `AGENTS.md`.

## Documentation
* **`@moduledoc` / `@doc` / `@spec`:** Required inline documentation for every module and public function (see [docs-enforce.md](../rules/docs-enforce.md)).
* **ExDoc (`mix docs`):** Generates the HTML documentation site from those attributes.

# Project Layout

1. **Monorepo:** All code lives in one repository. Each BEAM application (or umbrella) lives in its own directory under `apps/` (see [workspace-boundaries.md](../rules/workspace-boundaries.md)). There is no root `mix.exs`.
2. **Per-module apps:** Name apps with the `<project>_<module>` convention (e.g. `apps/my_app_billing/`, `apps/my_app_web/`). Each app has its own `mix.exs`, `lib/`, `test/`, and `config/`.
3. **Role separation:** Separate concerns by role so they can be deployed independently when needed, for example:
    * a **web** app running Phoenix/LiveView (UI, API, uploads);
    * a **worker** app running Oban queues for background processing and orchestration;
    * **domain** apps holding business logic with no web dependency.
4. **Shared code:** Prefer Hex or Git-referenced dependencies over local `path:` dependencies to keep each app exportable (see [src-isolation.md](../rules/src-isolation.md)).

# Configuration & Releases

* **Releases:** Ship with `mix release`. Releases run on the BEAM directly; in local development, apps run natively (`mix phx.server`) against Docker Compose backing services (see [centralized-infrastructure.md](../rules/centralized-infrastructure.md)).
* **`config/runtime.exs`:** All environment-specific and secret configuration (database URL, secret key base, API keys, ports) is read from environment variables at boot in `runtime.exs`, never hard-coded in compile-time config.
* **Environment detection:** Use `runtime.exs` to detect optional capabilities at boot (e.g. presence of a GPU driver) and choose a backend or fall back gracefully.

# Clustering & Distribution

* **Distributed Erlang:** Nodes communicate natively; `:erpc` calls functions on remote nodes.
* **libcluster:** Automatic node discovery, e.g. via Gossip, DNS (SRV/A records), or a Kubernetes strategy, per the deployment ADR.
* **Cookie:** Read the distribution cookie from an environment variable such as `RELEASE_COOKIE`. Never commit a cookie value to the repository.
* **Horde (optional):** Distributed registry and supervisor when a process must be unique cluster-wide and restart on a healthy node after a node failure.
* **Queue placement:** Configure Oban queues per node role so under-resourced nodes do not pick up heavy work.

# Observability

Follow `AGENTS.md` §10 and [logging-enforce.md](../rules/logging-enforce.md):

* **Logger to stdout:** Configure `Logger` to write unbuffered to `stdout`, structured as JSON (e.g. `LoggerJSON`). No file backends.
* **Telemetry & metrics:** Use `:telemetry` events with `PromEx` (or `TelemetryMetricsPrometheus`) to expose a `/metrics` endpoint for Prometheus, including BEAM-specific metrics (process count, memory, run queues).
* **Tracing:** OpenTelemetry for distributed traces across nodes and services.
* **Pipeline:** The recommended stack (or the ADR-selected equivalent) is Promtail → Redpanda → Loki for logs, Prometheus for metrics, and Grafana for dashboards.

# Optional, only when the PRD/ADRs require it

Do not add these by default. Introduce them only when a requirement or ADR calls for them, and record the decision in an ADR.

* **Machine learning (Nx / EXLA / Bumblebee):** Numerical computing and pre-trained model inference (e.g. from Hugging Face) inside the BEAM. Detect a GPU at boot in `runtime.exs` and use the accelerated EXLA backend if present; otherwise fall back to CPU. Bound inference concurrency (e.g. with `PartitionSupervisor` or `Nx.Serving` batch sizes) to the hardware available.
* **Vector search (pgvector):** Store and query embeddings in PostgreSQL for semantic search, via the `pgvector` extension and Ecto type.
* **Infrastructure as Code:** e.g. Terraform to provision infrastructure and Ansible (or an equivalent) to configure hosts and deploy releases, per ADR.
* **Multi-architecture builds:** When targets span CPU architectures (e.g. ARM64 and x86_64), keep the code portable and have CI (e.g. GitHub Actions) build a separate release per target architecture, since releases include the ERTS for their build platform.
