---
okf_version: "0.2"
---

# Agent Knowledge Bundle

Progressive disclosure listing for `.agents/kb/` — an [OKF v0.2](./okf.md) Knowledge Bundle. Open a concept only when the task needs that domain.

# Bundle orientation

* [Knowledge Base Bundle Guide](./README.md) - Purpose of this directory vs `resources/references/` and OKF conventions.
* [Open Knowledge Format (OKF) 0.2](./okf.md) - How to produce and consume OKF concepts (required reading for kb-synthesizer).

# Protocols & product platforms

* [AT Protocol (atproto)](./at-protocol.md) - Architecture, data model, identifiers, APIs, auth, sync, and moderation.
* [AT Protocol Blacksky Tutorial](./at-protocol-blacksky-tutorial.md) - Identity foundations and Permissioned Data proposal 0016 (draft).
* [AT Protocol (atproto) v2 — Combined](./at-protocol-v2.md) - Combined public protocol + permissioned data reference (draft).
* [HappyView](./happyview.md) - Schema-driven App View framework for AT Protocol.
* [Oxford Common File Layout (OCFL) 1.1](./ocfl.md) - Versioned object layout for FS and S3-compatible stores.

# Project standards

* [Agent Skills 1.0](./agent-skills-1.0.md) - Progressive disclosure, vendor neutrality, multi-tool support.
* [Conventional Commits 1.0.0](./conventional-commits.md) - Required Git commit message format.
* [RFC 2119 requirement keywords](./rfc-2119-req-terms.md) - MUST / SHOULD / MAY for PRDs and SRS.
* [RFC 3339 date and time](./rfc-3339-date-and-time.md) - Internet timestamps; UTC default.
* [ISO/IEC/IEEE 29148 SRS](./iso-29148-srs.md) - Unambiguous, complete, verifiable, consistent, traceable requirements.
* [ISO/IEC/IEEE 42010 ADRs](./iso-42010-adr.md) - Nine required information items for architecture decisions.

# Implementation playbooks

* [Phoenix LiveView Development (v1.8+)](./phoenix-liveview.md) - CRC pattern and layered BEAM/LiveView practices.
* [Tauri 2](./tauri-2.md) - Rust desktop host: capabilities, IPC, plugins, testing, and distribution (stable major 2).
