---
trigger: always_on
description: Run every quality gate through the local pre-commit hook; never add hosted CI such as GitHub Actions.
copyright: Pieter Van Garderen (2026)
license: CC-BY
---

# Local Verification, No Hosted CI

**Purpose:** This rule enforces the "Local Verification, No Hosted CI" principle in `AGENTS.md`. Developers run every quality gate on their own machine through `scripts/pre-commit.sh`. Hosted CI is slow, non-deterministic and outside the owner's control, so it is not used.

## MUST NOT

- Create `.github/workflows/`, `.gitlab-ci.yml`, or any other hosted CI configuration. If one exists, remove it rather than fixing it.
- Describe a check as "run in CI". Checks run in the pre-commit hook or not at all.
- Push a commit that fails `scripts/pre-commit.sh`.
- Bypass the hook with `--no-verify`. The only sanctioned shortcut is `VERIFY_SKIP_TESTS=1` for a work-in-progress commit that will not be pushed until `scripts/verify_tests.sh` passes.

## MUST

- Put every new gate in a `scripts/verify_*.sh` script and call it from `scripts/pre-commit.sh`. One script, one gate, non-zero exit on failure, a message that names the fix.
- Make each gate discover what to check (for example, every stack present under `apps/`) rather than naming specific products, so the scripts work unchanged in any repository that follows the same layout.
- Run `bash scripts/pre-commit.sh` from the repository root before every push, or install it once: `ln -s ../../scripts/pre-commit.sh .git/hooks/pre-commit`.
- Keep the gates platform-agnostic ([platform-agnostic.md](./platform-agnostic.md)) and verify any command they run ([command-verification.md](./command-verification.md)).
- Document a new gate, its environment variables and its runtime in the root README "Run tests" section in the same change.

## The gates

`scripts/pre-commit.sh` runs, in order:

| Step | Script | Checks |
|---|---|---|
| 0 | `verify_branch.sh` | No direct commits to `main`; branch name is `<type>/<slug>` with a permitted Conventional Commit type ([task-workflow.md](./task-workflow.md)) |
| 1 | `verify_isolated_ports.sh` | Unique dev, preview and bind ports ([port-conflicts.md](./port-conflicts.md)) |
| 2 | `verify_doc_sync.sh` | Source changes ship with documentation changes ([sync-logic.md](./sync-logic.md)) |
| 3 | `verify_srs_traceability.sh` | PRD and SRS IDs resolve both ways |
| 4 | `verify_relative_links.sh` | No absolute paths in staged Markdown ([links-enforce.md](./links-enforce.md)) |
| 5 | `verify_workspace_boundaries.sh` | No language or dependency manifests at the repository root ([workspace-boundaries.md](./workspace-boundaries.md)) |
| 6 | `verify_centralized_logging.sh` | No file logging ([logging-enforce.md](./logging-enforce.md)) |
| 7 | `verify_formatting.sh` | Formatting check for every stack under `apps/` (for example `cargo fmt`, `prettier`, `mix format`, `ruff`) |
| 8 | `verify_docs.sh` | ADR structure, PRD allocation, relative links and anchors, standalone workspace link boundaries, task cleanup (`scripts/docs/`) |
| 9 | `verify_tests.sh` | Lint and tests for every stack under `apps/` (for example Clippy, `cargo test`, rustdoc, npm `lint`/`check`/`test`, `mix test`, `pytest`); end-to-end tests only with `VERIFY_E2E=1` |

A repository that adopts this rule MAY add, remove or reorder gates to fit its stack, but MUST keep this table in sync with `scripts/pre-commit.sh` in the same change.

## Agent resolution mandate

If any step exits non-zero, the agent MUST NOT commit or push. Read the output, fix the cause, and rerun `bash scripts/pre-commit.sh` until it exits 0. Do not weaken a verifier to make it pass; an owner decision is required to change what a gate checks ([no-silent-restore.md](./no-silent-restore.md)).
