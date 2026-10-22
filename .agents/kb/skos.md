---
type: Reference
title: SKOS Simple Knowledge Organization System — Reference
description: Agent-facing synthesis of W3C SKOS Reference (REC 2009) covering classes, properties, constraints, and mapping vocabulary for knowledge organization systems.
resource: https://www.w3.org/TR/2009/REC-skos-reference-20090818/
tags: [skos, thesaurus, controlled-vocabulary, rdf, owl, knowledge-organization, linked-data]
status: stable
generated:
  by: process:kb-synthesizer
  at: 2026-10-20T00:00:00Z
sources:
  - id: skos-ref
    resource: https://www.w3.org/TR/2009/REC-skos-reference-20090818/
    title: "SKOS Simple Knowledge Organization System Reference — W3C Recommendation 18 August 2009"
    author: process:w3c
kb-title: SKOS Simple Knowledge Organization System — Reference
source-url: https://www.w3.org/TR/2009/REC-skos-reference-20090818/
spec-version: "REC-20090818"
last-updated: 2026-10-20T00:00:00Z
domain: Knowledge Organization, Linked Data, RDF, Thesauri
---

# SKOS Simple Knowledge Organization System Reference

**Purpose:** Normative reference for AI agents implementing or consuming SKOS data. Covers the full SKOS vocabulary — classes, properties, formal axioms (S-numbered statements), integrity conditions, and normative usage rules — as defined in the W3C Recommendation.[^skos-ref]

**TL;DR:** SKOS is an OWL Full vocabulary for publishing knowledge organization systems (thesauri, classification schemes, taxonomies) as linked data. Its three pillars are **concepts** (ideas/units of thought), **concept schemes** (aggregations of concepts), and **lexical labels** (multilingual strings attached to concepts). A small set of semantic and mapping properties links concepts within and across schemes.

---

## Namespace & Prefixes (Source: §1.7.2, §2)

| Prefix | URI |
|--------|-----|
| `skos:` | `http://www.w3.org/2004/02/skos/core#` |
| `rdf:` | `http://www.w3.org/1999/02/22-rdf-syntax-ns#` |
| `rdfs:` | `http://www.w3.org/2000/01/rdf-schema#` |
| `owl:` | `http://www.w3.org/2002/07/owl#` |

SKOS is defined as an **OWL Full** ontology, not OWL DL or OWL Lite. (Source: §1.2)

---

## SKOS Classes (Source: §3, §4, §9)

| Class | Axiom | Definition |
|-------|-------|-----------|
| `skos:Concept` | S1: `owl:Class` | Ideas or units of thought used in knowledge organization. |
| `skos:ConceptScheme` | S2: `owl:Class`; S9: disjoint with `skos:Concept` | An aggregation of one or more SKOS concepts, optionally with semantic links between them. |
| `skos:Collection` | S28: `owl:Class`; S37: disjoint with `skos:Concept` and `skos:ConceptScheme` | A labeled and/or ordered group of concepts. |
| `skos:OrderedCollection` | S29: sub-class of `skos:Collection` | A collection whose members are listed in a meaningful order via `skos:memberList`. |

**Integrity condition — disjointness:**
- S9: `skos:ConceptScheme` ⊓ `skos:Concept` = ∅ (Source: §4)
- S37: `skos:Collection` ⊓ `skos:Concept` = ∅; `skos:Collection` ⊓ `skos:ConceptScheme` = ∅ (Source: §9)

---

## Concept Scheme Properties (Source: §4)

| Property | Axiom | Domain | Range | Notes |
|----------|-------|--------|-------|-------|
| `skos:inScheme` | S3: `owl:ObjectProperty` | — | `skos:ConceptScheme` (S4) | Links a concept to its scheme. No domain restriction — any resource may be in a scheme. |
| `skos:hasTopConcept` | S5: domain `skos:ConceptScheme`; S6: range `skos:Concept` | `skos:ConceptScheme` | `skos:Concept` | Marks top-level concepts in a scheme. |
| `skos:topConceptOf` | S7: sub-property of `skos:inScheme`; S8: inverse of `skos:hasTopConcept` | `skos:Concept` | `skos:ConceptScheme` | Inverse of `hasTopConcept`. |

**Key rules:**
- A concept MAY belong to zero, one, or several schemes. (Source: §4.6.1)
- Schemes cannot be "closed" — no formal mechanism to declare a set of concepts exhaustive. (Source: §4.6.1)
- Membership in a scheme does NOT entail any semantic link between concepts. (Source: §4.6.4)

---

## Lexical Labels (Source: §5)

All label properties are `owl:AnnotationProperty` (S10) and sub-properties of `rdfs:label` (S11). Their range is **RDF plain literals** (S12), optionally with a BCP 47 language tag.

| Property | Use |
|----------|-----|
| `skos:prefLabel` | Preferred lexical label for a concept in a given language. |
| `skos:altLabel` | Alternative label (variant spellings, abbreviations, synonyms). |
| `skos:hiddenLabel` | Hidden label for search/indexing; not displayed to users. |

**Integrity conditions — label disjointness:**
- **S13:** `skos:prefLabel`, `skos:altLabel`, and `skos:hiddenLabel` are pairwise disjoint. A string value MUST NOT be both a `prefLabel` and an `altLabel` (or `hiddenLabel`) for the same resource in the same language. (Source: §5.4)
- **S14:** A resource has **at most one** value of `skos:prefLabel` per language tag. (Source: §5.4)

**Usage rules:**
- `skos:altLabel` and `skos:hiddenLabel` values MUST NOT duplicate the `prefLabel` for the same resource in the same language. (Source: §5.4, S13–S14)
- No domain restriction — labels can be attached to any RDF resource, not only `skos:Concept`. (Source: §5.6.1)
- Lookups for related language tags should follow the BCP 47 lookup algorithm. (Source: §5.6.5)

---

## Notation (Source: §6)

| Property | Axiom | Notes |
|----------|-------|-------|
| `skos:notation` | S15: `owl:DatatypeProperty` | Used with **typed literals** (datatype URI identifies the notation system). |

**Key rules:**
- A concept MAY have zero or more notations, including from different notation systems. (Source: §6.5.2)
- Within a given scheme and notation system, it is conventional (but not enforced by an integrity condition) for each concept to have a unique notation. (Source: §6.5.3)
- `skos:notation` uses typed literals; label properties use plain literals — do NOT confuse. (Source: §6.5.4)
- No domain restriction — notations can be attached to any resource. (Source: §6.5.5)

---

## Documentation Properties (Source: §7)

All documentation properties are `owl:AnnotationProperty` (S16). All except `skos:note` are sub-properties of `skos:note` (S17). No domain or range axioms are stated.

| Property | Purpose |
|----------|---------|
| `skos:note` | General-purpose annotation note. Parent of all documentation properties. |
| `skos:changeNote` | A note about a modification to a concept. |
| `skos:definition` | A formal definition of the intended meaning of a concept. |
| `skos:editorialNote` | An administrative note intended for editors. |
| `skos:example` | An example of the use of a concept. |
| `skos:historyNote` | A note about the history or origin of a concept. |
| `skos:scopeNote` | A note that helps to clarify the meaning or application of a concept. |

---

## Semantic Relations (Source: §8)

All are sub-properties of `skos:semanticRelation` with domain and range `skos:Concept` (S19–S20).

| Property | Axiom(s) | Notes |
|----------|----------|-------|
| `skos:semanticRelation` | S19: domain `skos:Concept`; S20: range `skos:Concept` | Super-property for all within-scheme concept relations. |
| `skos:broader` | S22: sub-prop of `skos:broaderTransitive` | Direct (not transitive) hierarchical link — more general concept. |
| `skos:narrower` | S22: sub-prop of `skos:narrowerTransitive`; S25: inverse of `skos:broader` | Direct hierarchical link — more specific concept. |
| `skos:broaderTransitive` | S21: sub-prop of `skos:semanticRelation`; S24: transitive; S26: inverse of `skos:narrowerTransitive` | Transitive hierarchical closure — not for direct assertions. |
| `skos:narrowerTransitive` | S21, S24, S26 | Transitive hierarchical closure — not for direct assertions. |
| `skos:related` | S21: sub-prop of `skos:semanticRelation`; S23: symmetric | Associative link between concepts at the same level. |

**Integrity condition:**
- **S27:** `skos:related` is disjoint with `skos:broaderTransitive` (and by inference `skos:narrowerTransitive`). A concept MUST NOT be both related to and in the transitive broader/narrower hierarchy of another concept. (Source: §8.6.10)

**Normative usage rules (Source: §8.1, §8.6):**
- Use `skos:broader` / `skos:narrower` for **direct** (immediate) hierarchical links only.
- `skos:broaderTransitive` / `skos:narrowerTransitive` MUST NOT be used to make direct assertions; they exist for inference over `broader`/`narrower` chains.
- `skos:related` is **not** transitive (Source: §8.6.4).
- `skos:broader` is **not** transitive (Source: §8.6.6) — use `broaderTransitive` for transitivity.
- Relations are not reflexive or irreflexive by default (Source: §8.6.5, §8.6.7).

---

## Collection Properties (Source: §9)

| Property | Axiom(s) | Domain | Range | Notes |
|----------|----------|--------|-------|-------|
| `skos:member` | S31: domain `skos:Collection`; S32 | `skos:Collection` | `skos:Concept` or `skos:Collection` | Links a collection to its members. |
| `skos:memberList` | S33: domain `skos:OrderedCollection`; S34: range `rdf:List`; S35: functional | `skos:OrderedCollection` | `rdf:List` | Ordered member list. Functional — one list per ordered collection. |

**Rule S36:** Every item in a `skos:memberList` is also a value of `skos:member`. (Source: §9)

---

## Mapping Properties (Source: §10)

Used to state alignment links between concepts **in different concept schemes**. All are `owl:ObjectProperty` (S38) and sub-properties of `skos:mappingRelation` (S40).

| Property | Axiom(s) | Symmetric | Transitive | Notes |
|----------|----------|-----------|-----------|-------|
| `skos:mappingRelation` | S39: sub-prop of `skos:semanticRelation` | — | — | Parent of all mapping properties. |
| `skos:closeMatch` | S40, S44 | ✓ | ✗ | Concepts sufficiently similar for interchangeable use in some IR applications. |
| `skos:exactMatch` | S42: sub-prop of `skos:closeMatch`; S44; S45 | ✓ | ✓ | High confidence of interchangeability across a wide range of applications. |
| `skos:broadMatch` | S40, S41: sub-prop of `skos:broader` | — | — | Hierarchical mapping — object is more general. |
| `skos:narrowMatch` | S40, S41: sub-prop of `skos:narrower`; S43: inverse of `skos:broadMatch` | — | — | Hierarchical mapping — object is more specific. |
| `skos:relatedMatch` | S40, S41: sub-prop of `skos:related`; S44 | ✓ | ✗ | Associative mapping link. |

**Integrity condition:**
- **S46:** `skos:exactMatch` is disjoint with `skos:broadMatch` and `skos:relatedMatch`. By symmetry and inverse, also disjoint with `skos:narrowMatch`. (Source: §10.4)

**Consistency checks (Source: §10.5):**
- `exactMatch` + `broadMatch` to the **same** concept: **NOT consistent** (violates S46).
- `exactMatch` + `relatedMatch` to the **same** concept: **NOT consistent** (violates S46).
- `broadMatch` + `relatedMatch` to **different** concepts: consistent.
- `exactMatch` alone, or `closeMatch` alone: consistent.

**Usage convention:** Mapping properties link concepts in different schemes by convention; semantic relation properties may also be used across schemes and remain consistent. (Source: §10.6.1)

---

## Design Principles (Source: §1)

- **OWL Full ontology** — not OWL DL/Lite; concepts are individuals, not classes. (Source: §1.2–1.3)
- **Open World Assumption** — domain and range axioms license inferences; they are not validation constraints. (Source: §1.5)
- **Integrity conditions separate from inference** — S-numbered integrity conditions are stated separately from purely inference-oriented axioms. (Source: §1.4)
- **No overcommitment** — when a constraint is doubtful, it is omitted or stated as a usage convention only. (Source: §1.6)
- **Labels and notations have no domain restriction** — they may be attached to any RDF resource. (Source: §5.6.1, §6.5.5)
- **No closed schemes** — SKOS has no mechanism to declare a concept scheme exhaustive. (Source: §4.6.1)
- Turtle syntax with `@base <http://example.org/ns/>` is used in examples. (Source: §1.7.3)

---

## Complete Axiom Index (S-numbers)

| S# | Statement |
|----|-----------|
| S1 | `skos:Concept` is an `owl:Class` |
| S2 | `skos:ConceptScheme` is an `owl:Class` |
| S3 | `skos:inScheme` is an `owl:ObjectProperty` |
| S4 | range of `skos:inScheme` is `skos:ConceptScheme` |
| S5 | domain of `skos:hasTopConcept` is `skos:ConceptScheme` |
| S6 | range of `skos:hasTopConcept` is `skos:Concept` |
| S7 | `skos:topConceptOf` is a sub-property of `skos:inScheme` |
| S8 | `skos:topConceptOf` is inverse of `skos:hasTopConcept` |
| S9 | `skos:ConceptScheme` disjoint with `skos:Concept` |
| S10 | Label properties are `owl:AnnotationProperty` |
| S11 | Label properties are sub-properties of `rdfs:label` |
| S12 | Range of label properties is RDF plain literals |
| S13 | `prefLabel`, `altLabel`, `hiddenLabel` are pairwise disjoint |
| S14 | At most one `prefLabel` per language tag per resource |
| S15 | `skos:notation` is an `owl:DatatypeProperty` |
| S16 | Documentation properties are `owl:AnnotationProperty` |
| S17 | All doc properties except `skos:note` are sub-props of `skos:note` |
| S19 | domain of `skos:semanticRelation` is `skos:Concept` |
| S20 | range of `skos:semanticRelation` is `skos:Concept` |
| S21 | `broaderTransitive`, `narrowerTransitive`, `related` ⊑ `semanticRelation` |
| S22 | `broader` ⊑ `broaderTransitive`; `narrower` ⊑ `narrowerTransitive` |
| S23 | `skos:related` is `owl:SymmetricProperty` |
| S24 | `broaderTransitive`, `narrowerTransitive` are `owl:TransitiveProperty` |
| S25 | `skos:narrower` is inverse of `skos:broader` |
| S26 | `narrowerTransitive` is inverse of `broaderTransitive` |
| S27 | `skos:related` disjoint with `skos:broaderTransitive` |
| S28 | `skos:Collection` is an `owl:Class` |
| S29 | `skos:OrderedCollection` is a sub-class of `skos:Collection` |
| S31 | domain of `skos:member` is `skos:Collection` |
| S32 | range of `skos:member` is `skos:Concept` or `skos:Collection` |
| S33 | domain of `skos:memberList` is `skos:OrderedCollection` |
| S34 | range of `skos:memberList` is `rdf:List` |
| S35 | `skos:memberList` is `owl:FunctionalProperty` |
| S36 | Every item in `memberList` is also a value of `member` |
| S37 | `skos:Collection` disjoint with `skos:Concept` and `skos:ConceptScheme` |
| S38 | Mapping properties are `owl:ObjectProperty` |
| S39 | `skos:mappingRelation` ⊑ `skos:semanticRelation` |
| S40 | `closeMatch`, `broadMatch`, `narrowMatch`, `relatedMatch` ⊑ `mappingRelation` |
| S41 | `broadMatch` ⊑ `broader`; `narrowMatch` ⊑ `narrower`; `relatedMatch` ⊑ `related` |
| S42 | `skos:exactMatch` ⊑ `skos:closeMatch` |
| S43 | `skos:narrowMatch` is inverse of `skos:broadMatch` |
| S44 | `relatedMatch`, `closeMatch`, `exactMatch` are `owl:SymmetricProperty` |
| S45 | `skos:exactMatch` is `owl:TransitiveProperty` |
| S46 | `skos:exactMatch` disjoint with `skos:broadMatch` and `skos:relatedMatch` |

---

## Agent Rules Summary

1. Always declare `skos:Concept`, `skos:ConceptScheme`, and `skos:Collection` instances as individuals, not classes.
2. Enforce S13/S14: never assign the same string as both `prefLabel` and `altLabel`/`hiddenLabel` for the same resource+language.
3. Enforce one `prefLabel` per language tag per concept (S14).
4. Use `skos:broader`/`skos:narrower` for **direct** links only; never assert `broaderTransitive`/`narrowerTransitive` directly.
5. Enforce S27: flag any concept that is both `related` to and in the broader/narrower hierarchy of another concept.
6. When aligning across schemes, use mapping properties (`broadMatch`, `exactMatch`, etc.) rather than semantic relation properties.
7. Enforce S46: `exactMatch` to concept X excludes `broadMatch` or `relatedMatch` to the same X.
8. Do not treat domain/range axioms as closed-world validators; they are inference licenses only.
9. `skos:notation` requires typed literals; `skos:prefLabel` and other label properties require plain literals.
10. A concept may belong to multiple schemes (S4 carries no cardinality restriction).

[^skos-ref]: SKOS Simple Knowledge Organization System Reference — W3C Recommendation 18 August 2009
