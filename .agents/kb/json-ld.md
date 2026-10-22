---
type: Reference
title: JSON-LD 1.1 — Syntax Specification
description: Agent-facing synthesis of the W3C JSON-LD 1.1 Syntax Recommendation — keywords, data model, conformance rules, container types, and security considerations.
resource: https://w3c.github.io/json-ld-syntax/
tags: [json-ld, linked-data, rdf, w3c, serialization, semantic-web]
status: stable
generated:
  by: process:kb-synthesizer
  at: 2026-10-20T00:00:00Z
sources:
  - id: json-ld-syntax
    resource: https://w3c.github.io/json-ld-syntax/
    title: JSON-LD 1.1 — A JSON-based Serialization for Linked Data (W3C Recommendation)
    author: process:w3c-json-ld-wg
  - id: json-ld-api
    resource: https://w3c.github.io/json-ld-api/
    title: JSON-LD 1.1 Processing Algorithms and API
    author: process:w3c-json-ld-wg
  - id: json-ld-framing
    resource: https://w3c.github.io/json-ld-framing/
    title: JSON-LD 1.1 Framing
    author: process:w3c-json-ld-wg
kb-title: JSON-LD 1.1 — Syntax Specification
source-url: https://w3c.github.io/json-ld-syntax/
spec-version: "1.1"
last-updated: 2026-10-20T00:00:00Z
domain: Knowledge Representation, Linked Data, Serialization, RDF
---

# JSON-LD 1.1 — Syntax Specification

**Purpose:** Synthesized reference for AI agents implementing or consuming **JSON-LD 1.1** documents. Covers the data model, all keywords, conformance rules, container types, context handling, and security considerations. Companion specs (algorithms, framing) are linked separately.[^json-ld-syntax]

**TL;DR:** JSON-LD is a **JSON-based serialization for Linked Data**. A JSON document becomes JSON-LD by adding a `@context` that maps terms to IRIs. The data model is a labeled directed graph (nodes + edges). JSON-LD 1.1 supersedes 1.0; existing 1.0 documents remain broadly compatible. Three normative documents: this syntax spec, the [Processing Algorithms and API][^json-ld-api], and [Framing][^json-ld-framing].

---

## Novice Mental Model

| Everyday idea | JSON-LD equivalent |
|---------------|-------------------|
| A JSON document with meaning | JSON-LD document |
| "What do these keys mean?" | `@context` — maps terms → IRIs |
| Identity of a thing | `@id` — an IRI or blank node identifier |
| Class / type of a thing | `@type` |
| The graph | Labeled, directed; nodes are IRIs, blank nodes, or literals |
| Plain literal string | JSON string; language tagged with `@language` |
| Typed literal | Value object: `{ "@value": …, "@type": … }` |
| Ordered list | `@list` container (maps to `rdf:first`/`rdf:rest`) |
| Unordered set | `@set` container (ensures array form; order not preserved) |
| Named graph | `@graph` key |
| Compact IRI | `prefix:localname` (e.g. `schema:name`) |
| Namespace prefix | Term with `"@prefix": true` in context |

---

## Data Model (Source: §3)

JSON-LD represents a **labeled, directed graph**:

- **Nodes** — resources identified by IRIs, blank node identifiers, or literal values.
- **Edges** — properties (IRIs) from a subject node to an object node or literal value.
- **Blank nodes** — nodes without an IRI; identified only within a document.
- **Literal values** — strings (optionally language-tagged or direction-tagged), or typed literals (IRI datatype).
- **Named graphs** — a set of triples associated with a graph name (IRI or blank node).

### Document forms

| Form | Description |
|------|-------------|
| **Expanded** | All terms replaced by IRIs; no `@context`; most explicit |
| **Compacted** | Terms replaced by context-defined aliases; shortest form for a given context |
| **Flattened** | All node objects at the top level; all blank node identifiers explicit |
| **Framed** | Hierarchically restructured per a frame document (see Framing spec) |

---

## Keyword Reference (Source: §3, §4, §6, §7, §8, §9)

All keywords begin with `@`. They are **case-sensitive**. Terms that start with `@` but are not defined keywords SHOULD be avoided — they may become keywords in a future version.

### Context keywords

| Keyword | Scope | Purpose |
|---------|-------|---------|
| `@context` | Node object, value in `@import` | Maps terms to IRIs; sets base, vocab, language, direction; may be an object, string IRI, array, or `null` |
| `@base` | Context definition | Sets the base IRI for relative IRI resolution within the context |
| `@vocab` | Context definition | Sets the default vocabulary IRI; unmapped terms expand against it |
| `@language` | Context definition or value object | Default natural language for plain string values |
| `@direction` | Context definition or value object | Base text direction (`"ltr"` or `"rtl"`) for strings |
| `@import` | Context definition | Merges a remote context; the imported context MUST NOT itself contain `@import` |
| `@propagate` | Context definition | Controls whether context propagates into nested nodes (`true` default; `false` scopes it) |
| `@protected` | Term definition | Prevents the term from being overridden; only identical redefinitions or property-scoped contexts may override |
| `@prefix` | Term definition | `true` allows the term to be used as a compact IRI prefix |
| `@version` | Context definition | Numeric `1.1` — sets processing mode to `json-ld-1.1` |

### Node / value keywords

| Keyword | Purpose |
|---------|---------|
| `@id` | IRI or blank node identifier of the node; omit for anonymous (blank) nodes |
| `@type` | Node type IRI(s); or in a value object, the datatype IRI; or in a term definition, coerces values to that type |
| `@value` | Literal value of a value object |
| `@language` | Language tag (BCP 47) for a string value object |
| `@direction` | Base direction (`"ltr"` / `"rtl"`) for a string value object |
| `@json` | Datatype alias; marks a value as a JSON literal (rdf:JSON) |
| `@graph` | Contains the node objects of a named or default graph |
| `@nest` | Groups properties in the JSON tree without creating a graph edge; the nested properties belong to the enclosing node |
| `@reverse` | Express reverse properties (incoming edges); value is a map of property → node |
| `@included` | Holds secondary/included node objects within a node object |
| `@index` | Provides a string index value for a node when used in an index map |
| `@none` | Catch-all key in index maps / language maps for items lacking the indexed feature |
| `@list` | Wraps an array as an ordered RDF list (rdf:first/rdf:rest chain) |
| `@set` | Ensures a value is always represented as an array; unordered semantics |

### Container types (`@container` values)

| Value | Effect |
|-------|--------|
| `@list` | Values are an ordered list |
| `@set` | Values always coerced to array; order not significant |
| `@language` | Values are a language map: `{ "en": "Hello", "fr": "Bonjour" }` |
| `@index` | Values are an index map keyed by arbitrary string index |
| `@id` | Values are an id map keyed by `@id` value |
| `@type` | Values are a type map keyed by `@type` value |
| `@graph` | Values represent named graphs; combined with `@index` or `@id` for named graph indexing |

Multiple container values may appear in an array (e.g. `["@graph", "@index"]`).[^json-ld-syntax]

---

## Conformance Rules (Source: §2, §4, §6)

### Document-level

- A conformant JSON-LD document MUST be valid JSON (per RFC 8259) and MUST follow the JSON-LD grammar.
- All keywords, keys, and values are **case-sensitive**.
- Setting the processing mode explicitly to `json-ld-1.1` is **RECOMMENDED** (via `"@version": 1.1` in `@context`).[^json-ld-syntax]
- A JSON document MAY be interpreted as JSON-LD without modification when terms overlap with IRIs by coincidence — conformance is evaluated on the document's stated use of JSON-LD mechanisms.

### Terms

- Terms MUST NOT be empty strings.
- Terms MUST NOT be of the form `@<ALPHA>+` unless they are defined keywords (such strings are reserved for future keywords).
- Terms containing a colon (`:`) SHOULD NOT be used as plain terms, because they may be interpreted as compact IRIs or absolute IRIs.
- A compact IRI prefix MUST expand to the same IRI in isolation as it does when used as a prefix.
- **Circular term definitions** are not allowed.

### Context handling

- Contexts in an array MUST be processed in order; each subsequent context is merged into the active context.
- All contexts within an array MUST share the same `@propagate` value.
- An `@import`-ed remote context MUST resolve to a context definition object (not an IRI or array) and MUST NOT itself contain `@import`.
- A **protected term** (`"@protected": true`) cannot be overridden except by an identical redefinition or within a property-scoped context.
- A context may be set to `null` to reset the active context to the initial state.

### IRIs

- Neither an IRI reference nor a compact IRI may expand to an unrelated IRI (i.e. the expansion must be consistent with the context definition).
- `@base` resolves relative IRIs in `@id` and `@type` values within the document.
- `@vocab` provides the default expansion for unmapped terms; if absent, unmapped terms that are not IRIs are dropped during expansion.

### Value objects

- A value object MUST contain `@value`.
- It MAY contain `@type` OR `@language`/`@direction`, but NOT both `@type` and `@language`/`@direction` simultaneously.
- `@language` values MUST be valid BCP 47 language tags (case-insensitive).
- `@direction` values MUST be `"ltr"` or `"rtl"`.

### Lists and sets

- `@list` represents an **ordered** collection; ordering is significant and preserved via RDF reification (`rdf:first`/`rdf:rest`/`rdf:nil`).
- `@set` represents an **unordered** collection; order may change during processing.
- JSON-LD 1.1 supports **lists of lists** (nested `@list`), unlike 1.0.
- An `@list` or `@set` value is always an array, even when empty or single-valued.[^json-ld-syntax]

---

## Graph and Named Graph Handling (Source: §6, §9)

- The **default graph** holds triples not in any named graph.
- `@graph` at the top level of a node object creates a named graph if the enclosing node has an `@id`.
- Multiple named graphs can be indexed using `["@graph", "@index"]` or `["@graph", "@id"]` container combinations.
- `@included` allows secondary node objects to appear inside a node object without nesting them as property values.

---

## Processing Modes (Source: §2)

| Mode | Behavior |
|------|----------|
| `json-ld-1.0` | Restricts processing to JSON-LD 1.0 features; 1.1-only constructs raise errors |
| `json-ld-1.1` | Default for new documents; enables all 1.1 features |

Processing mode is set via `"@version": 1.1` in a `@context`. Consuming implementations SHOULD default to `json-ld-1.1`.[^json-ld-syntax]

---

## Relationship to RDF (Source: §3, §10)

- JSON-LD is a concrete RDF syntax. Every JSON-LD document maps to an RDF dataset.
- Blank nodes serialize as `_:identifier` in N-Quads / Turtle output.
- `@type` without `@vocab` expansion maps to `rdf:type`.
- `rdf:langString` is the implicit datatype for language-tagged strings.
- `rdf:JSON` is the datatype for JSON literals (`@json` values).
- `rdf:nil`, `rdf:first`, `rdf:rest` encode ordered lists.

---

## Security & Privacy Considerations (Source: §12)

- **Remote contexts** are a significant attack surface: a compromised or malicious context server can redefine terms and alter the meaning of a document. Implementations SHOULD use context caching and integrity checking.
- Applications SHOULD use `@protected` terms to prevent untrusted remote contexts from overriding critical term definitions.
- Context IRI dereferencing SHOULD respect same-origin or CORS policies.
- Documents embedding sensitive data SHOULD NOT expose `@id` values that reveal private resource identifiers.
- Implementations that load remote contexts SHOULD support content security policies (CSP) to restrict context origins.
- The `@base` and `@vocab` values can be used to redirect property expansion; treat untrusted contexts with the same caution as untrusted scripts.

---

## Normative References

| Reference | Role |
|-----------|------|
| RFC 8259 | JSON data interchange format |
| RFC 3987 | Internationalized Resource Identifiers (IRIs) |
| RFC 3986 | URI generic syntax |
| RFC 5234 | ABNF |
| BCP 47 | Language tags |
| RDF 1.1 Concepts | The underlying graph data model |
| JSON-LD 1.1 API | Processing algorithms (expansion, compaction, flattening, RDF serialization) |
| JSON-LD 1.1 Framing | Restructuring JSON-LD output per a frame template |

---

## Companion Specifications

| Spec | Purpose |
|------|---------|
| [JSON-LD 1.1 API](https://w3c.github.io/json-ld-api/) | Expansion, compaction, flattening, toRDF, fromRDF algorithms |
| [JSON-LD 1.1 Framing](https://w3c.github.io/json-ld-framing/) | Reshaping a JSON-LD document against a frame |

---

## Agent Implementation Rules

1. **Always include `@context`** when producing JSON-LD; without it, a JSON document is plain JSON only.
2. **Prefer IRI values** for `@id` and `@type`; use `@vocab` in the context to avoid repeating long namespace prefixes.
3. **Set `"@version": 1.1`** in every new context to opt into 1.1 processing.
4. **Use `@protected`** for terms that must not be overridden by merged contexts.
5. **Do not use `@import` within an imported context** — circular or nested imports are not allowed.
6. **Respect term restrictions:** no empty terms, no `@…` terms unless they are defined keywords, no colon-containing terms as plain terms.
7. **Distinguish `@list` vs `@set`:** use `@list` when order matters; use `@set` when ensuring array form without semantic ordering.
8. **Treat remote contexts as untrusted code:** cache them, verify integrity, and scope overrides with `@protected`.
9. **Value objects:** never combine `@type` with `@language` or `@direction`.
10. **Blank node identifiers** are local to a document; do not rely on them across document boundaries.

---

## Quick Decision Table

| Question | Answer (JSON-LD 1.1) |
|----------|-----------------------|
| Minimum to make a JSON doc JSON-LD? | Add `@context` |
| How to assert a resource's IRI? | `"@id": "https://…"` |
| How to assert a type? | `"@type": "schema:Person"` |
| How to tag a string with language? | `{ "@value": "Hello", "@language": "en" }` |
| How to represent an ordered list? | `"@list": […]` or `"@container": "@list"` in context |
| How to prevent term overrides? | `"@protected": true` in term definition |
| How to embed a named graph? | `{ "@id": "…", "@graph": [ … ] }` |
| How to group properties without edges? | `"@nest": { … }` |
| How to reverse a property? | `"@reverse": { "property": { … } }` |
| How to use a prefix? | Term with `"@prefix": true` and `"@id": "https://ns.example/"` |
| Lists of lists supported? | Yes (JSON-LD 1.1 only) |
| Are blank node IDs portable? | No — local to the document |

[^json-ld-syntax]: JSON-LD 1.1 — A JSON-based Serialization for Linked Data (W3C Recommendation)
[^json-ld-api]: JSON-LD 1.1 Processing Algorithms and API
[^json-ld-framing]: JSON-LD 1.1 Framing
