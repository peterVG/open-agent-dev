# Architecture Decision Record - Arkrim Dragon
007-blob-storage-provider.md

## Title: 007 - Blob Storage Provider Selection
## Status: Accepted
## Context / Requirement Reference:
Arkrim Dragon downloads and retains raw multi-megabyte payloads sourced from archiving portals. The infrastructure strictly requires abstracting heavy filesystem writes mapped in `prd.md`.

## Decision:
We construct persistent BLOB integrations strictly around **DigitalOcean S3 droplets**.

## Rationale:
DigitalOcean S3 provides highly cost-effective, AWS-compliant API routing specifically suited for independent developer budgets, directly aligning with the "Scale-To-Zero" principles without the massive AWS ingress architectures or vendor complexities.

## Assumptions:
Assumes the `boto3` equivalent packages on FastAPI connect through strict `.env` DigitalOcean endpoint references.

## Alternatives Considered:
- **Cloudflare R2**: Highlighted extensively in previous downstream legacy documentation before being eradicated during the `srs.md` PRD alignment synchronization scrub.
- **AWS S3 Native**: Ignored due to heavy configuration and variable hidden costs.

## Consequences / Implications:
Requires configuring DigitalOcean API endpoints in the environment variables securely.

## Related Decisions / Notes:
See `srs.md` Data Privacy / Storage overrides.
