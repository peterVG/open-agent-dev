# Data directory

This directory is used to store application and user data that is excluded from code versioning as it can become quite large.

It is used by the services in [`docker-compose.yml`](../docker-compose.yml), for example:
* Observability storage (started by `docker compose up -d`): `data/loki_data/`, `data/prometheus_data/`, `data/grafana_data/`
* Log buffering (opt-in `buffering` profile, `docker compose --profile buffering up -d`): Redpanda data in `data/redpanda_data/`
* Example datastores (opt-in `datastores` profile, `docker compose --profile datastores up -d`; keep, replace, or remove per your database ADR): a Postgres database in `data/postgres_data/`, or an optional Elasticsearch index in `data/es_data/`

Credentials set through environment variables (for example `GF_SECURITY_ADMIN_PASSWORD` or `POSTGRES_PASSWORD`) only apply the first time a service initializes its directory here. To rotate or reset them, stop the service (`docker compose stop grafana`) and delete its directory (`data/grafana_data/` or `data/postgres_data/`), then start it again. This erases that service's data.

You can add your own data for use by your application:
* `data/mydata1/`
* `data/mydata2/`
