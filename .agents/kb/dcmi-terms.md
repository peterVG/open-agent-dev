---
type: Reference
title: DCMI Metadata Terms (dcterms)
description: Agent-facing synthesis of the Dublin Core Metadata Initiative Terms vocabulary — all properties, classes, encoding schemes, and type vocabulary defined under the /terms/, /elements/1.1/, /dcmitype/, and /dcam/ namespaces.
resource: https://www.dublincore.org/specifications/dublin-core/dcmi-terms/
tags: [metadata, dublin-core, rdf, vocabulary, interoperability, libraries, archives]
status: stable
generated:
  by: process:kb-synthesizer
  at: 2026-10-20T18:00:00Z
sources:
  - id: dcmi-terms-spec
    resource: https://www.dublincore.org/specifications/dublin-core/dcmi-terms/
    title: DCMI Metadata Terms — DCMI Recommendation
    author: process:DCMI-Usage-Board
    last_modified: 2020-01-20
kb-title: DCMI Metadata Terms (dcterms)
source-url: https://www.dublincore.org/specifications/dublin-core/dcmi-terms/
spec-version: "2020-01-20"
last-updated: 2026-10-20T18:00:00Z
domain: Metadata, Knowledge Representation, Libraries, Archives, Linked Data
---

# DCMI Metadata Terms (dcterms)

**Purpose:** Reference for agents implementing or consuming Dublin Core metadata. Covers all four DCMI namespaces: the original 15 elements (`/elements/1.1/`), the richer `/terms/` vocabulary, the DCMI Type Vocabulary (`/dcmitype/`), and the vocabulary description terms (`/dcam/`).[^dcmi-terms-spec]

**TL;DR:** Dublin Core defines a small set of cross-domain metadata properties, classes, and encoding schemes for describing any resource. `/terms/` is the preferred namespace; it mirrors the 15 original elements and adds typed properties, classes, and relationships. Use URIs for agents and controlled vocabularies for subjects, types, and languages.

---

## Namespaces

| Prefix | URI | Purpose |
|--------|-----|---------|
| `dcterms:` | `http://purl.org/dc/terms/` | **Primary namespace** — properties, classes, datatypes, encoding schemes |
| `dc:` | `http://purl.org/dc/elements/1.1/` | Legacy 15 elements; no formal ranges; supported indefinitely |
| `dcmitype:` | `http://purl.org/dc/dcmitype/` | DCMI Type Vocabulary (12 resource type classes) |
| `dcam:` | `http://purl.org/dc/dcam/` | Vocabulary description terms (`domainIncludes`, `rangeIncludes`, etc.) |

---

## Key Constraints

- Agents SHOULD use `/terms/` URIs rather than legacy `/elements/1.1/` URIs for new implementations. (Source: §Introduction)
- **Dates** MUST use ISO 8601-1; recommended profiles are W3CDTF or EDTF. Date ranges use `/` as separator; open ends are permitted. (Source: §Usage notes — Date)
- **Agents** (creator, contributor, publisher, rightsHolder): SHOULD be identified by a URI; use a literal only if a URI is not feasible. (Source: §Usage notes — Agent properties)
- **Language**: Use ISO 639-2, ISO 639-3, or an IETF BCP 47 tag. (Source: §Usage notes — Language)
- **Subject**: SHOULD use a controlled vocabulary. (Source: §Usage notes — Subject)
- **Type**: SHOULD use the DCMI Type Vocabulary (`dcmitype:` classes). (Source: §Usage notes — Type)
- **Format**: SHOULD use a controlled vocabulary (e.g., IANA media types); extent gives file size in MB or duration as ISO 8601. (Source: §Usage notes — Format)
- **Coverage**: SHOULD use a controlled vocabulary such as TGN; prefer named places or periods over numeric identifiers. (Source: §Usage notes — Coverage)
- **Identifier**: SHOULD be a string from an identification system; persistent identifiers SHOULD be HTTP URIs. (Source: §Usage notes — Identifier)
- Non-RDF consumers MAY ignore formal domain/range constraints; treat them as usage suggestions. (Source: §Introduction)
- Inverse pairs (`hasPart`/`isPartOf`, `hasFormat`/`isFormatOf`, etc.) are intended for non-literal values. (Source: §Usage notes)
- Collection terms (`accrualMethod`, `accrualPeriodicity`, `accrualPolicy`) have domain `dcterms:Collection`; DCMI provides recommended vocabularies for their values. (Source: §dcterms: Properties)

---

## The 15 Core Elements (both `/elements/1.1/` and `/terms/`)

| Property | URI suffix | Definition |
|----------|------------|------------|
| Contributor | `contributor` | Entity that contributed to the resource |
| Coverage | `coverage` | Spatial or temporal topic, applicability, or jurisdiction |
| Creator | `creator` | Entity primarily responsible for the resource |
| Date | `date` | Point or period associated with a lifecycle event of the resource |
| Description | `description` | Account of the resource |
| Format | `format` | File format, physical medium, or dimensions |
| Identifier | `identifier` | Unambiguous reference in a given context |
| Language | `language` | Language of the resource |
| Publisher | `publisher` | Entity responsible for making the resource available |
| Relation | `relation` | Related resource |
| Rights | `rights` | Rights held in and over the resource |
| Source | `source` | Resource from which this resource is derived |
| Subject | `subject` | Topic of the resource |
| Title | `title` | Name given to the resource |
| Type | `type` | Nature or genre of the resource |

---

## `/terms/` Properties (55 total — core 15 + 40 refinements)

### Title refinements
| Property | Definition | Range |
|----------|------------|-------|
| `alternative` | Alternative name (abbreviation, translation) | `rdfs:Literal` |

### Date refinements (all range: `rdfs:Literal`)
`available`, `created`, `dateAccepted`, `dateCopyrighted`, `dateSubmitted`, `issued`, `modified`, `valid`

| Property | Definition |
|----------|------------|
| `available` | Date resource became or will become available |
| `created` | Date of creation |
| `dateAccepted` | Date of acceptance (e.g., thesis, article) |
| `dateCopyrighted` | Date of copyright |
| `dateSubmitted` | Date of submission |
| `issued` | Date of formal issuance |
| `modified` | Date of change |
| `valid` | Date(s) of validity |

### Description refinements
| Property | Definition |
|----------|------------|
| `abstract` | Summary of the resource |
| `tableOfContents` | List of subunits |

### Rights refinements
| Property | Range | Definition |
|----------|-------|------------|
| `accessRights` | `RightsStatement` | Who can access, and under what terms |
| `license` | `LicenseDocument` | Legal document granting use rights |
| `rights` | `RightsStatement` | IPR or other rights statements |
| `rightsHolder` | `Agent` | Person or org owning or managing rights |

### Identifier refinements
| Property | Range | Definition |
|----------|-------|------------|
| `bibliographicCitation` | `rdfs:Literal` | Bibliographic reference for the resource |

### Relation refinements (inverse pairs)
| Property | Inverse | Definition |
|----------|---------|------------|
| `conformsTo` | — | Standard the resource conforms to |
| `hasFormat` | `isFormatOf` | Pre-existing related resource with same intellectual content |
| `hasPart` | `isPartOf` | Included physical or logical resource |
| `hasVersion` | `isVersionOf` | Related resource that is a version, edition, or adaptation |
| `isReferencedBy` | `references` | Referenced by related resource |
| `isReplacedBy` | `replaces` | Resource supplanted by another |
| `isRequiredBy` | `requires` | Resource required by the described resource |

### Coverage refinements
| Property | Range | Definition |
|----------|-------|------------|
| `spatial` | `Location` | Spatial characteristics |
| `temporal` | `PeriodOfTime` | Temporal characteristics |

### Audience properties
| Property | Range | Definition |
|----------|-------|------------|
| `audience` | `AgentClass` | Class of agents for whom the resource is intended |
| `educationLevel` | `AgentClass` | Audience's educational level |
| `mediator` | `AgentClass` | Entity mediating access to the resource |

### Agent properties
| Property | Range | Subproperty of | Definition |
|----------|-------|----------------|------------|
| `creator` | `Agent` | `dc:creator`, `dcterms:contributor` | Entity primarily responsible |
| `contributor` | `Agent` | — | Entity contributing to resource |
| `publisher` | `Agent` | — | Entity making resource available |

### Collection management
| Property | Domain | Range | Definition |
|----------|--------|-------|------------|
| `accrualMethod` | `Collection` | `MethodOfAccrual` | Method by which items are added |
| `accrualPeriodicity` | `Collection` | `Frequency` | Rate at which items are added |
| `accrualPolicy` | `Collection` | `Policy` | Policy governing item addition |

### Other properties
| Property | Range | Definition |
|----------|-------|------------|
| `language` | `LinguisticSystem` | Language of the resource |
| `provenance` | `ProvenanceStatement` | Statement of changes in ownership and custody |
| `instructionalMethod` | `MethodOfInstruction` | Process used for teaching |
| `source` | — | Resource from which this one is derived |
| `subject` | — | Topic |
| `type` | — | Nature or genre |
| `coverage` | `Location`, `PeriodOfTime`, `Jurisdiction` | Spatial/temporal topic or jurisdiction |

---

## `/terms/` Classes (22)

| Class | Subclass of | Definition |
|-------|-------------|------------|
| `Agent` | — | Resource that acts or has the potential to act |
| `AgentClass` | `rdfs:Class` | Group of agents |
| `BibliographicResource` | — | Book, article, or other documentary resource |
| `FileFormat` | `MediaType` | Digital resource format |
| `Frequency` | — | Rate at which something recurs |
| `Jurisdiction` | `LocationPeriodOrJurisdiction` | Extent of authority |
| `LicenseDocument` | `RightsStatement` | Legal document granting permission |
| `LinguisticSystem` | — | System of signs/rules for communication (e.g., language) |
| `Location` | `LocationPeriodOrJurisdiction` | Spatial region or named place |
| `LocationPeriodOrJurisdiction` | — | Location, period of time, or jurisdiction |
| `MediaType` | `MediaTypeOrExtent` | File format or physical medium |
| `MediaTypeOrExtent` | — | Media type or extent/duration |
| `MethodOfAccrual` | — | Method by which resources join a collection |
| `MethodOfInstruction` | — | Process for building knowledge and skills |
| `PeriodOfTime` | `LocationPeriodOrJurisdiction` | Interval defined by start and end dates |
| `PhysicalMedium` | `MediaType` | Physical material or carrier (paper, DVD, etc.) |
| `PhysicalResource` | — | Material thing |
| `Policy` | — | Plan or course of action by an authority |
| `ProvenanceStatement` | — | Significant changes in ownership and custody |
| `RightsStatement` | — | IPR statement, license, or access rights statement |
| `SizeOrDuration` | `MediaTypeOrExtent` | Dimension, extent, or playback/execution time |
| `Standard` | — | Reference point for evaluation or comparison |

---

## Vocabulary Encoding Schemes (9)

These identify controlled vocabularies. Use with `dcam:memberOf`.

| Term | URI (`dcterms:`) | Vocabulary |
|------|-----------------|------------|
| `DCMIType` | dcterms:DCMIType | DCMI Type Vocabulary |
| `DDC` | dcterms:DDC | Dewey Decimal Classification |
| `IMT` | dcterms:IMT | IANA Media Types |
| `LCC` | dcterms:LCC | Library of Congress Classification |
| `LCSH` | dcterms:LCSH | Library of Congress Subject Headings |
| `MESH` | dcterms:MESH | Medical Subject Headings |
| `NLM` | dcterms:NLM | National Library of Medicine Classification |
| `TGN` | dcterms:TGN | Getty Thesaurus of Geographic Names |
| `UDC` | dcterms:UDC | Universal Decimal Classification |

---

## Syntax Encoding Schemes / Datatypes (12)

These specify value syntaxes for literal values.

| Term | Syntax / Standard |
|------|-------------------|
| `Box` | DCMI Box — geographic regions |
| `ISO3166` | ISO 3166-1 country codes |
| `ISO639-2` | ISO 639-2 three-letter language codes |
| `ISO639-3` | ISO 639-3 three-letter language codes |
| `Period` | DCMI Period — time intervals |
| `Point` | DCMI Point — geographic coordinates |
| `RFC1766` | Language tags (superseded) |
| `RFC3066` | Language tags; obsoleted by RFC 4646 |
| `RFC4646` | Language tags; obsoleted by RFC 5646 |
| `RFC5646` | Language tags (current BCP 47 basis) |
| `URI` | Identifiers per RFC 3986 |
| `W3CDTF` | W3C Date and Time Formats profile of ISO 8601 |

---

## DCMI Type Vocabulary (`/dcmitype/`, 12 classes)

All are instances of `dcterms:DCMIType` (a `VocabularyEncodingScheme`). Use these as values for `dcterms:type` or `dc:type`.

| Class | URI (`dcmitype:`) | Definition |
|-------|------------------|------------|
| `Collection` | dcmitype:Collection | Aggregation of resources |
| `Dataset` | dcmitype:Dataset | Data in a defined structure |
| `Event` | dcmitype:Event | Non-persistent, time-based occurrence |
| `Image` | dcmitype:Image | Visual representation other than text |
| `InteractiveResource` | dcmitype:InteractiveResource | Resource requiring user interaction |
| `MovingImage` | dcmitype:MovingImage | Series of images conveying motion (subclass of Image) |
| `PhysicalObject` | dcmitype:PhysicalObject | Inanimate 3D object or substance |
| `Service` | dcmitype:Service | System providing one or more functions |
| `Software` | dcmitype:Software | Computer program |
| `Sound` | dcmitype:Sound | Resource primarily intended to be heard |
| `StillImage` | dcmitype:StillImage | Static visual representation (subclass of Image) |
| `Text` | dcmitype:Text | Resource consisting primarily of words for reading |

---

## Vocabulary Description Terms (`/dcam/`, 4)

Used in defining DCMI Terms themselves; available for describing other RDF vocabularies.

| Term | URI | Definition |
|------|-----|------------|
| `domainIncludes` | dcam:domainIncludes | Suggested class for subjects of a property |
| `memberOf` | dcam:memberOf | Links a resource to a VocabularyEncodingScheme |
| `rangeIncludes` | dcam:rangeIncludes | Suggested class for values of a property |
| `VocabularyEncodingScheme` | dcam:VocabularyEncodingScheme | Enumerated set of resources (a controlled vocabulary) |

---

## Agent Decision Table

| Task | Recommended practice |
|------|---------------------|
| Describe who created a resource | `dcterms:creator` with URI of a Person/Organization (FOAF or similar) |
| Record creation date | `dcterms:created` with ISO 8601 date literal |
| Record modification date | `dcterms:modified` with ISO 8601 date |
| Classify resource type | `dcterms:type` with a `dcmitype:` class URI |
| Assign subject | `dcterms:subject` with URI from LCSH, MESH, TGN, or other vocab |
| Record language | `dcterms:language` with ISO 639-2/3 code or BCP 47 tag |
| Link to license | `dcterms:license` with a URI (e.g., Creative Commons URI) |
| Record file format | `dcterms:format` with IANA media type (from `dcterms:IMT`) |
| Express part-whole | `dcterms:hasPart` / `dcterms:isPartOf` with non-literal resource URIs |
| Describe a collection's update rate | `dcterms:accrualPeriodicity` on a `dcterms:Collection` instance |
| Give rights statement | `dcterms:rights` or `dcterms:accessRights` with a `RightsStatement` URI |

---

## Related Standards

- [Dublin Core Abstract Model](https://www.dublincore.org/specifications/dublin-core/abstract-model/) — underlying data model
- [DCMI Metadata Terms release history](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/release_history/)
- [FOAF vocabulary](http://xmlns.com/foaf/spec/) — commonly used for `Agent` instances
- [W3C Date and Time Formats (W3CDTF)](https://www.w3.org/TR/NOTE-datetime)

[^dcmi-terms-spec]: DCMI Metadata Terms — DCMI Recommendation (2020-01-20), https://www.dublincore.org/specifications/dublin-core/dcmi-terms/
