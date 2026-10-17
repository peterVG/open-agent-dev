# Data directory

This directory is used to store application and user data that is excluded from code versioning as it can become quite large.

It is used by the services in [`docker-compose.yml`](../docker-compose.yml), for example:
* Observability storage: `data/loki_data/`, `data/prometheus_data/`, `data/grafana_data/`
* Example datastores (keep, replace, or remove per your database ADR): a Postgres database in `data/postgres_data/`, or an optional Elasticsearch index in `data/es_data/`

You can add your own data for use by your application:
* `data/mydata1/`
* `data/mydata2/`
