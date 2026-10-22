---
type: Reference
title: PROV-O — The PROV Ontology (W3C Recommendation)
description: OWL2 ontology of the W3C PROV-DM provenance data model; classes, properties, qualification pattern, and agent rules for recording who did what, when, and with what.
resource: https://www.w3.org/TR/2013/REC-prov-o-20130430/
tags: [provenance, ontology, owl, rdf, prov, w3c, linked-data]
status: stable
generated:
  by: process:kb-synthesizer
  at: 2026-10-20T20:00:00Z
sources:
  - id: prov-o-rec
    resource: https://www.w3.org/TR/2013/REC-prov-o-20130430/
    title: PROV-O — The PROV Ontology, W3C Recommendation 30 April 2013
    author: process:w3c
    last_modified: 2013-04-30
kb-title: PROV-O — The PROV Ontology (W3C Recommendation)
source-url: https://www.w3.org/TR/2013/REC-prov-o-20130430/
spec-version: "REC-20130430"
last-updated: 2026-10-20T20:00:00Z
domain: Provenance, Knowledge Representation, Linked Data, OWL
---

# PROV-O — The PROV Ontology

**Purpose:** Agent-facing reference for the W3C PROV Ontology (PROV-O). Covers the OWL2 class/property hierarchy, the three-tier structure, the qualification pattern, namespace, and implementation rules for recording provenance in RDF.[^prov-o-rec]

**TL;DR:** PROV-O is an OWL 2 ontology that maps the PROV Data Model (PROV-DM) into RDF. The core model is three nodes — **Entity, Activity, Agent** — connected by six unqualified properties. Every binary relation can optionally be *qualified* through an intermediate influence node to attach richer metadata (time, role, plan). PROV-O is serialized in Turtle/RDF; the namespace is `http://www.w3.org/ns/prov#`.

---

## Namespace and Prefixes

| Prefix | IRI |
|--------|-----|
| `prov:` | `http://www.w3.org/ns/prov#` (**canonical namespace**) |
| OWL encoding URI | `https://www.w3.org/ns/prov-o` |
| `rdf:` | `http://www.w3.org/1999/02/22-rdf-syntax-ns#` |
| `xsd:` | `http://www.w3.org/2001/XMLSchema#` |
| `owl:` | `http://www.w3.org/2002/07/owl#` |

All PROV-O terms are under `http://www.w3.org/ns/prov#`. Prefixes `foaf`, `sioc`, `dcterms` appear only in non-normative examples and are not PROV-O terms. (Source: §1.1)

---

## Novice Mental Model

| Everyday idea | PROV-O term |
|---------------|-------------|
| A piece of data, document, or thing | `prov:Entity` |
| A process that ran | `prov:Activity` |
| A person, system, or org responsible | `prov:Agent` |
| "This file was created by that process" | `prov:wasGeneratedBy` |
| "That process read this file" | `prov:used` |
| "This data came from that data" | `prov:wasDerivedFrom` |
| "A person is responsible for this entity" | `prov:wasAttributedTo` |
| "This process was run by this agent" | `prov:wasAssociatedWith` |
| "This agent acted on behalf of another" | `prov:actedOnBehalfOf` |
| "Add richer metadata to a relation" | Qualification pattern (see below) |
| "A named set of provenance statements" | `prov:Bundle` |

---

## Three-Tier Structure (Source: §1.2)

PROV-O terms are organized into three progressively detailed levels:

**Tier 1 — Starting Point:** The minimal vocabulary for basic provenance descriptions. Sufficient for most use cases. Classes: Entity, Activity, Agent. Six core properties: `wasGeneratedBy`, `used`, `wasDerivedFrom`, `wasAttributedTo`, `wasAssociatedWith`, `actedOnBehalfOf`.

**Tier 2 — Expanded:** Subclasses and subproperties that refine starting-point terms; additional relations for richer descriptions. Introduces Person, Organization, SoftwareAgent, Collection, Bundle, Plan, Location, and properties like `startedAtTime`, `endedAtTime`, `wasInformedBy`, `wasInfluencedBy`, `alternateOf`, `specializationOf`, `hadMember`, `atLocation`, `generated`, `invalidated`.

**Tier 3 — Qualified:** The qualification pattern — intermediate nodes that attach attributes to a binary relation. Every Tier 1 and Tier 2 relation has a corresponding `qualified*` property pointing to an influence class. Introduces the Influence class hierarchy and all qualifying classes (Generation, Usage, Association, Delegation, Derivation, Attribution, Communication, Start, End, Invalidation, Influence, Role).

---

## Core Classes

### Starting Point Classes (Source: §3.1)

| Class | OWL type | Definition |
|-------|----------|------------|
| `prov:Entity` | owl:Class | A physical, digital, conceptual, or other kind of thing with some fixed aspects. Entities can be real or imaginary. |
| `prov:Activity` | owl:Class | Something that occurs over a time period and acts upon or with entities; may include consuming, processing, transforming, modifying, relocating, using, or generating entities. |
| `prov:Agent` | owl:Class | Something that bears some form of responsibility for an activity taking place, for the existence of an entity, or for another agent's activity. |

### Expanded Classes (Source: §3.2)

| Class | Subclass of | Definition |
|-------|-------------|------------|
| `prov:Person` | Agent | A human being. |
| `prov:Organization` | Agent | A social or legal institution such as a company, society, etc. |
| `prov:SoftwareAgent` | Agent | A running software system. |
| `prov:Collection` | Entity | An entity that provides a structure to some constituents (member entities). |
| `prov:EmptyCollection` | Collection | A collection with no members. |
| `prov:Bundle` | Entity | A named set of provenance descriptions; enables provenance of provenance. |
| `prov:Plan` | Entity | A set of intended actions (steps) an agent followed. Subclass of Entity. |
| `prov:Location` | owl:Class | A place (physical, virtual, or otherwise). Properties of Location are outside PROV-O scope; left for extension. |

### Qualified (Influence) Classes (Source: §3.3)

| Class | Subclass of | Qualifies |
|-------|-------------|-----------|
| `prov:Influence` | owl:Class | Superclass of all influence types; used with `wasInfluencedBy` / `qualifiedInfluence` |
| `prov:EntityInfluence` | Influence | When the influencer is an Entity |
| `prov:ActivityInfluence` | Influence | When the influencer is an Activity |
| `prov:AgentInfluence` | Influence | When the influencer is an Agent |
| `prov:InstantaneousEvent` | owl:Class | Superclass of time-bounded influence events |
| `prov:Generation` | InstantaneousEvent, EntityInfluence | Qualifies `wasGeneratedBy` |
| `prov:Usage` | InstantaneousEvent, EntityInfluence | Qualifies `used` |
| `prov:Invalidation` | InstantaneousEvent, EntityInfluence | Qualifies `wasInvalidatedBy` |
| `prov:Start` | InstantaneousEvent, EntityInfluence | Qualifies `wasStartedBy` |
| `prov:End` | InstantaneousEvent, EntityInfluence | Qualifies `wasEndedBy` |
| `prov:Communication` | ActivityInfluence | Qualifies `wasInformedBy` |
| `prov:Derivation` | EntityInfluence | Qualifies `wasDerivedFrom` |
| `prov:PrimarySource` | Derivation | Qualifies `hadPrimarySource` |
| `prov:Quotation` | Derivation | Qualifies `wasQuotedFrom` |
| `prov:Revision` | Derivation | Qualifies `wasRevisionOf` |
| `prov:Attribution` | AgentInfluence | Qualifies `wasAttributedTo` |
| `prov:Association` | AgentInfluence | Qualifies `wasAssociatedWith` |
| `prov:Delegation` | AgentInfluence | Qualifies `actedOnBehalfOf` |
| `prov:Role` | owl:Class | The function an Agent played in an Activity. Provided for extension. |

---

## Properties

### Starting Point Properties (Source: §3.1)

| Property | Type | Domain | Range | Notes |
|----------|------|--------|-------|-------|
| `prov:wasGeneratedBy` | op | Entity | Activity | Entity came into existence through this Activity |
| `prov:used` | op | Activity | Entity | Activity made use of this Entity |
| `prov:wasDerivedFrom` | op | Entity | Entity | Entity came from another Entity (superproperty of hadPrimarySource, wasQuotedFrom, wasRevisionOf) |
| `prov:wasAttributedTo` | op | Entity | Agent | Entity's existence ascribed to an Agent |
| `prov:wasAssociatedWith` | op | Activity | Agent | Activity associated with an Agent who had some responsibility |
| `prov:actedOnBehalfOf` | op | Agent | Agent | Agent acted under authorization of another Agent |

### Expanded Properties (Source: §3.2)

| Property | Type | Domain | Range | Notes |
|----------|------|--------|-------|-------|
| `prov:startedAtTime` | dp | Activity | xsd:dateTime | Time activity started |
| `prov:endedAtTime` | dp | Activity | xsd:dateTime | Time activity ended |
| `prov:wasInformedBy` | op | Activity | Activity | Activity was informed/enabled by another Activity |
| `prov:wasInfluencedBy` | op | Entity/Activity/Agent | Any | Generic superproperty of all influence relations |
| `prov:hadPrimarySource` | op | Entity | Entity | Subproperty of `wasDerivedFrom`; first-hand source |
| `prov:wasQuotedFrom` | op | Entity | Entity | Subproperty of `wasDerivedFrom`; direct quotation |
| `prov:wasRevisionOf` | op | Entity | Entity | Subproperty of `wasDerivedFrom`; revision/update |
| `prov:wasInvalidatedBy` | op | Entity | Activity | Entity ceased to exist via this Activity |
| `prov:wasStartedBy` | op | Activity | Entity | Entity triggered/started the Activity |
| `prov:wasEndedBy` | op | Activity | Entity | Entity triggered/ended the Activity |
| `prov:generated` | op | Activity | Entity | Inverse of `wasGeneratedBy` |
| `prov:invalidated` | op | Activity | Entity | Inverse of `wasInvalidatedBy` |
| `prov:alternateOf` | op | Entity | Entity | Entities present aspects of the same thing but not necessarily the same aspects or at the same time |
| `prov:specializationOf` | op | Entity | Entity | More specific entity → more general entity (shares all aspects plus more) |
| `prov:hadMember` | op | Collection | Entity | Entity is a member of the Collection |
| `prov:atLocation` | op | Entity/Activity/Agent/InstantaneousEvent | Location | Location of the subject |
| `prov:generatedAtTime` | dp | Entity | xsd:dateTime | Time of entity generation (shortcut) |
| `prov:invalidatedAtTime` | dp | Entity | xsd:dateTime | Time of entity invalidation (shortcut) |
| `prov:value` | dp | Entity | rdfs:Literal | A literal value for the entity |
| `prov:influenced` | op | Any | Any | Inverse of `wasInfluencedBy` |

### Qualified Properties (Source: §3.3)

Each `qualified*` property points from the influenced node to an intermediate influence class instance that can carry additional attributes.

| Property | Domain | Range (influence class) |
|----------|--------|------------------------|
| `prov:qualifiedGeneration` | Entity | Generation |
| `prov:qualifiedInvalidation` | Entity | Invalidation |
| `prov:qualifiedDerivation` | Entity | Derivation |
| `prov:qualifiedPrimarySource` | Entity | PrimarySource |
| `prov:qualifiedQuotation` | Entity | Quotation |
| `prov:qualifiedRevision` | Entity | Revision |
| `prov:qualifiedAttribution` | Entity | Attribution |
| `prov:qualifiedUsage` | Activity | Usage |
| `prov:qualifiedCommunication` | Activity | Communication |
| `prov:qualifiedAssociation` | Activity | Association |
| `prov:qualifiedStart` | Activity | Start |
| `prov:qualifiedEnd` | Activity | End |
| `prov:qualifiedDelegation` | Agent | Delegation |
| `prov:qualifiedInfluence` | Entity/Activity/Agent | Influence |

### Influence Node Properties (Source: §3.3)

Properties used within influence/qualification nodes:

| Property | Type | Domain | Range | Notes |
|----------|------|--------|-------|-------|
| `prov:entity` | op | EntityInfluence | Entity | The influencing entity |
| `prov:activity` | op | ActivityInfluence | Activity | The influencing activity |
| `prov:agent` | op | AgentInfluence | Agent | The influencing agent |
| `prov:influencer` | op | Influence | Entity/Activity/Agent | Generic influencer (superproperty of entity/activity/agent) |
| `prov:atTime` | dp | InstantaneousEvent | xsd:dateTime | Time of the instantaneous event |
| `prov:hadRole` | op | Influence | Role | Role the agent or entity played |
| `prov:hadPlan` | op | Association | Plan | Plan the agent intended to follow |
| `prov:hadActivity` | op | Derivation | Activity | Activity that carried out the derivation |
| `prov:hadUsage` | op | Derivation | Usage | Usage within a derivation |
| `prov:hadGeneration` | op | Derivation | Generation | Generation within a derivation |

---

## The Qualification Pattern (Source: §3.3)

The qualification pattern is PROV-O's mechanism for enriching a binary relation with additional metadata without losing the simpler unqualified form.

**Pattern:**

```turtle
# Unqualified (Tier 1/2)
:foo prov:wasGeneratedBy :bar .

# Qualified (Tier 3) — adds atTime and hadRole
:foo prov:qualifiedGeneration [
    a prov:Generation ;
    prov:activity :bar ;
    prov:atTime "2013-03-16T00:00:00"^^xsd:dateTime ;
    prov:hadRole :role_x
] .
```

**Rules for the qualification pattern:**

- Producing a qualified form SHOULD be accompanied by the equivalent unqualified triple (e.g., `wasGeneratedBy` alongside `qualifiedGeneration`). (Source: §3.3)
- Consumers SHOULD treat a qualified relation as implying the corresponding unqualified relation. (Source: §3.3)
- Use the unqualified form when no extra attributes are needed. (Source: §3.3)
- Use the most specific qualifying class available (e.g., `prov:Revision` not just `prov:Derivation` for revisions). (Source: §3.3)

---

## OWL Profile

- PROV-O is an **OWL 2** ontology. It is substantially compatible with **OWL 2 RL** (the profile suited for rule-based reasoning over large datasets), with the exception of **five axioms** that fall outside OWL 2 RL (listed in Appendix A of the spec; not reproduced here). (Source: §4, Appendix A)
- **Declared inverses:** `prov:generated` ↔ `prov:wasGeneratedBy`; `prov:invalidated` ↔ `prov:wasInvalidatedBy`. Additional inverse names are normative in Appendix B of the spec.
- **Subproperty chains:** `wasInfluencedBy` is the superproperty of all influence relations; `wasDerivedFrom` is the superproperty of `hadPrimarySource`, `wasQuotedFrom`, `wasRevisionOf`.
- Normative sections are 1.1, 1.2, 3, 4, and Appendix B. All examples and figures are **informative**.

---

## PROV-DM Correspondence

PROV-O is the OWL encoding of the PROV Data Model (PROV-DM). Key mappings:

| PROV-DM concept | PROV-O term |
|-----------------|-------------|
| entity | prov:Entity |
| activity | prov:Activity |
| agent | prov:Agent |
| generation | prov:Generation / wasGeneratedBy |
| usage | prov:Usage / used |
| derivation | prov:Derivation / wasDerivedFrom |
| start | prov:Start / startedAtTime |
| end | prov:End / endedAtTime |
| attribution | prov:Attribution / wasAttributedTo |
| association | prov:Association / wasAssociatedWith |
| delegation | prov:Delegation / actedOnBehalfOf |
| bundle | prov:Bundle |

Full PROV-DM cross-reference: https://www.w3.org/TR/prov-dm/

---

## Agent Implementation Rules

1. **Always declare `prov:type`** on instances where applicable (Entity, Activity, Agent, or a subclass). Use the most specific subclass.
2. **Prefer unqualified properties** when no extra attributes are needed; they are simpler and widely understood.
3. **Include the unqualified triple when using the qualified form** — do not use `qualifiedGeneration` without also asserting `wasGeneratedBy`.
4. **Use the most specific subclass and subproperty** — `prov:Person` not just `prov:Agent`; `prov:wasRevisionOf` not just `prov:wasDerivedFrom`, when applicable.
5. **Serialize in Turtle** for single-graph provenance; use TriG when representing Bundles (named graphs).
6. **`prov:Bundle` is itself a `prov:Entity`**, so you can make provenance statements *about* a provenance graph.
7. **`prov:atTime` on InstantaneousEvent subclasses** (Generation, Usage, etc.) is the correct locus for precise timestamps on events — not on the Entity or Activity itself; use `generatedAtTime` / `invalidatedAtTime` only as shortcuts.
8. **`prov:hadRole`** attaches to an influence node, not directly to an Agent or Entity — role information must be inside a `qualifiedAssociation` or similar.
9. **`prov:Role`** and `prov:Location` are extension points — PROV-O provides the hooks; domain vocabularies define specific roles and location types.
10. **Do not conflate `alternateOf` and `specializationOf`**: `alternateOf` is symmetric (same thing, different aspects); `specializationOf` is asymmetric and transitive (all aspects of the general plus more).
11. **Consumers MUST NOT require full OWL 2 reasoning** if targeting interoperability — the five non-OWL-RL axioms mean full OWL 2 DL reasoners may derive more inferences than OWL RL rule engines.
12. **Provenance of provenance** is supported natively: record provenance about a `prov:Bundle` by treating it as an Entity.

---

## Minimal Working Example (Turtle)

```turtle
@prefix prov: <http://www.w3.org/ns/prov#> .
@prefix ex:   <http://example.org/> .
@prefix xsd:  <http://www.w3.org/2001/XMLSchema#> .

# Starting Point
ex:dataset a prov:Entity .
ex:etlJob  a prov:Activity ;
    prov:startedAtTime "2026-10-01T08:00:00Z"^^xsd:dateTime ;
    prov:endedAtTime   "2026-10-01T09:30:00Z"^^xsd:dateTime .
ex:alice   a prov:Person .

ex:dataset prov:wasGeneratedBy ex:etlJob .
ex:etlJob  prov:used ex:sourceFile .
ex:etlJob  prov:wasAssociatedWith ex:alice .
ex:dataset prov:wasAttributedTo ex:alice .
ex:sourceFile a prov:Entity .

# Qualified form (adds timestamp to generation)
ex:dataset prov:qualifiedGeneration [
    a prov:Generation ;
    prov:activity ex:etlJob ;
    prov:atTime "2026-10-01T09:30:00Z"^^xsd:dateTime
] .
```

---

## Quick Decision Table

| Question | Answer |
|----------|--------|
| What is the PROV-O namespace? | `http://www.w3.org/ns/prov#` (prefix `prov:`) |
| Core three node types? | Entity, Activity, Agent |
| Core six properties? | wasGeneratedBy, used, wasDerivedFrom, wasAttributedTo, wasAssociatedWith, actedOnBehalfOf |
| How to add a timestamp to a generation event? | Use `qualifiedGeneration` → Generation node → `atTime` |
| How to record a person's role in an activity? | Use `qualifiedAssociation` → Association → `hadRole` → Role |
| Is PROV-O OWL 2 RL compatible? | Mostly yes; five axioms are exceptions (see spec Appendix A) |
| Can you record provenance of provenance? | Yes — Bundle is an Entity |
| When to use alternateOf vs specializationOf? | alternateOf: same thing, different aspects (symmetric); specializationOf: more specific (asymmetric, transitive) |
| Is the Qualified form optional? | Yes — use it only when you need extra attributes on a relation |

---

## Related Resources

| Resource | Role |
|----------|------|
| [PROV-DM](https://www.w3.org/TR/prov-dm/) | Normative PROV Data Model underlying PROV-O |
| [PROV-N](https://www.w3.org/TR/prov-n/) | Human-readable notation for PROV |
| [PROV-PRIMER](https://www.w3.org/TR/prov-primer/) | Introductory guide to PROV |
| [PROV-AQ](https://www.w3.org/TR/prov-aq/) | Provenance access and query |
| [PROV-XML](https://www.w3.org/TR/prov-xml/) | XML serialization of PROV-DM |

[^prov-o-rec]: PROV-O — The PROV Ontology, W3C Recommendation 30 April 2013
