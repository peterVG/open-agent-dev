---
trigger: always_on
description: Ensure all applications follow 12 Factor App logging rules and integrate with the centralized observability stack.
---

# Logging and Observability Enforcement

**Purpose:** This file instructs the AI agent on exactly how to implement logging to satisfy the "12 Factor Logging & Observability" mandate in `AGENTS.md`. It serves as a unified standard applicable to any programming language or framework in the repository.

## Execution Requirements

When configuring application code, CI/CD pipelines, or generating Docker Compose environments across any tech stack, the agent MUST strictly enforce the following rules:

### 1. Application Logging (Stdout Only)
- **Zero File Logging:** Applications MUST NEVER attempt to route or store their own log files on disk. (e.g., Python `FileHandler`, Node.js file transports, and Elixir file backends are strictly forbidden).
- **Stdout Only:** All applications MUST configure their respective logging frameworks (e.g., `structlog`/`logging` for Python, `pino`/`console` for Node.js, `Logger` for Elixir) to output their event streams exclusively and unbuffered to `stdout`.

### 2. Infrastructure Topology
The agent MUST configure the local `docker-compose.yml` to capture and route these container logs into the mandated centralized observability stack:
- **Promtail:** Configured to read Docker/container stdout logs natively.
- **Redpanda:** Configured as a high-throughput, Kafka-compatible event broker buffer.
- **Loki:** Configured to receive indices from Redpanda/Promtail and securely store them for long-term archival.
- **Prometheus:** Configured to scrape `/metrics` endpoints from the applications.
- **Grafana:** Configured with Loki as the logging data source and Prometheus as the metrics data source.

### 3. README Documentation
- When standing up or modifying this containerized infrastructure, the agent MUST explicitly add instructions under the `## View logs` section (located under `# Setup Development Environment`) of the project's root `README.md` detailing how developers can spin up the full observability stack via `docker-compose`. 
- The agent MUST document how developers can access the Grafana UI locally to query and view the emitted container logs.
