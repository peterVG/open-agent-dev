# Architecture Decision Record - Arkrim Dragon
004-centralized-observability.md

## Title: 004 - Distributed Centralized Observability Ecosystem
## Status: Accepted
## Context / Requirement Reference:
The `AGENTS.md` manifesto dictates a strict Centralized Logging & Observability mandate across all apps in the monorepo. Local file logging by applications is completely forbidden. A robust telemetry and extraction architecture is required to view and stream standard-out container logs predictably.

## Decision:
We implement the following infrastructure stack initialized natively via Docker Compose:
- **Promtail**: To hook into Docker's stdout streams globally.
- **Redpanda**: To act as the high-throughput, Kafka-compatible message broker to safely buffer streams.
- **Loki**: To act as the core, indexed data warehouse for archival stream storage.
- **Prometheus**: To scrape application `/metrics` APIs explicitly.
- **Grafana**: To act as the centralized UI combining all telemetry streams into visual dashboards.

## Rationale:
Routing unbuffered logs to stdout and abstracting routing entirely to Promtail removes all logging overhead from the Python/SvelteKit runtimes. Redpanda provides zero-data-loss resiliency for massive spikes over traditional logstash setups, while Loki perfectly indexes logs using an identical syntactic language to Prometheus metric tracking in Grafana.

## Assumptions:
Assumes each app explicitly outputs to unbuffered `stdout` (e.g. Python logging framework without `FileHandler`).

## Alternatives Considered:
- **ELK Stack (Elasticsearch, Logstash, Kibana)**: Rejected as overly dense, RAM intensive, and harder to synchronize perfectly with native metrics (Prometheus) efficiently compared to the Grafana ecosystem.

## Consequences / Implications:
Requires developers to exclusively use Grafana to view historical outputs during deep debugging instead of opening local `.log` files.

## Related Decisions / Notes:
See `logging-enforce.md`.
