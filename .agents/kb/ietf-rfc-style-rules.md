---
type: Reference
title: IETF RFC Style Guide — Formatting & Structure Rules
description: Actionable formatting, structure, and style rules for IETF RFC documents, synthesized from draft-rpc-rfc7322bis-02.
resource: https://www.ietf.org/archive/id/draft-rpc-rfc7322bis-02.html
tags: [ietf, rfc, style-guide, formatting, document-structure, technical-writing]
status: stable
generated:
  by: process:kb-synthesizer
  at: 2026-10-20T19:00:00Z
sources:
  - id: rfc7322bis
    resource: https://www.ietf.org/archive/id/draft-rpc-rfc7322bis-02.html
    title: "RFC Style Guide (draft-rpc-rfc7322bis-02)"
    author: process:ietf-rpc
kb-title: IETF RFC Style Guide — Formatting & Structure Rules
source-url: https://www.ietf.org/archive/id/draft-rpc-rfc7322bis-02.html
spec-version: "draft-rpc-rfc7322bis-02"
last-updated: 2026-10-20T19:00:00Z
domain: Technical Writing, IETF, Standards
---

# IETF RFC Style Guide — Formatting & Structure Rules

**Purpose:** Agent-facing synthesis of IETF RFC formatting and style rules from RFC 7322bis. Covers governing principles, language, punctuation, citations, abbreviations, document structure, and required/optional sections.

**TL;DR:** RFCs follow Chicago Manual of Style with IETF exceptions. The RFC Editor applies edits; authors retain technical meaning. Required sections have a mandated order. American English is the fallback. Every citation needs a reference; every reference needs a citation.

---

## Governing Principles (Source: §1, §2, Appendix A)

- Base style: Chicago Manual of Style, with IETF-listed exceptions.[^rfc7322bis]
- Editors MUST NOT change the intended technical meaning; original wording prevails when it more accurately describes technical content. (Source: §2)
- Editing is not technical review; consistency is sought within a document, within a cluster, and across the RFC Series. (Source: §2)
- If a document cannot be edited without risking meaning changes, it MAY be returned to the stream-approving body. (Source: §2, A.2)
- Disputes escalate to the RFC Series Editor, then to the process in RFC 6635. (Source: A.1)

---

## Keyword Usage (Source: §3)

- The style guide itself does NOT use RFC 2119/8174 terminology.
- Lowercase **"must"** marks changes the RFC Editor applies automatically (not at author discretion).
- Lowercase **"should"** marks recommendations that are not required and may be questioned.

---

## Language (Source: §3.1)

- Publication language: English.
- American or British spelling is acceptable; MUST be consistent within a document.
- Mixed spelling within a document or cluster is converted to American English.

---

## Punctuation (Source: §3.2)

| Rule | Detail |
|------|--------|
| Serial comma | Required before the last item in a series |
| Literal quoted strings | Punctuation goes **outside** the quotation marks |
| General quoted text (from another RFC) | Punctuation MAY go inside |
| Block quotations | No quotation marks needed |

**RFC citations as compounds (§3.2.1)**

- Avoid hyphenated compounds built on RFC numbers; reword instead.
- Attributive use: write "RFC 5011-style" (no hyphen between "RFC" and the number).
- Do NOT attach a citation tag to text with a hyphen.

---

## DNS Names and URIs (Source: §3.3)

- Use BCP 32 reserved example DNS names for generic examples.
- Angle brackets are **strongly recommended** around URIs (STD 66).
- HTTPS is **strongly preferred** over HTTP.

---

## Capitalization (Source: §3.4)

| Context | Rule |
|---------|------|
| Within a document | Must be consistent; check online terms table |
| RFC and section titles | Title case |
| Section titles written as sentences | Sentence case |
| Figure titles | Sentence case OR title case |
| "Working group" / "research group" | Capitalize only when part of a specific group name; lowercase generically |

---

## Citations (Source: §3.5)

1. Every citation MUST have a matching reference, and every reference MUST have a matching citation.
2. Citation tags are enclosed in square brackets: `[RFC2119]`.
3. Citations use ASCII only (RFC 7997).
4. Tags begin with a letter or digit; may contain letters, digits, colons, hyphens, underscores, and dots. No spaces, commas, quotation marks, or other punctuation. Example: `[IEEE.802.15.4]` (not `[RFC 2119]` with a space).
5. Tags are placed inline with the text.
6. Cross-references use section numbers, NOT page numbers.
7. A citation may follow its subject or be read as part of the sentence — one style MUST be used consistently.
8. A repeatedly cited document is anchored at first use outside the Abstract; additional citations at author's discretion.

---

## Abbreviations (Source: §3.6)

- Expand abbreviations in titles and at first use in the body; place abbreviation in parentheses after the expansion.
- Common abbreviations (TCP, IP, SNMP, HTTP, etc.) need not be expanded.
- An Abbreviations or Terminology section is optional; first-use expansion in the body is still required even if such a section exists.
- Entries marked "No Expansion" on the IETF online list MUST NOT be expanded.

---

## Images and Figures (Source: §3.7)

| Rule | Detail |
|------|--------|
| Legibility | Must be legible on a 1920×1080 screen and printable on A4/US Letter |
| Color | Black on white only; no color or greyscale (RFC 7990, RFC 7996) |
| Complexity | Keep diagrams simple; use multiple diagrams for multiple ideas |
| Font preference | Sans-serif generally preferred for digital material (unsettled in spec) |
| Consistency | Fonts, shapes, and line styles MUST be consistent within an RFC and across a cluster |
| Line meaning | Line thickness, color, and arrow types MUST carry the same meaning throughout |
| Flowcharts | Avoid crossing lines where possible |
| Captions | Encouraged for all figures and artwork (RFC 7991) |

---

## Document Structure (Source: §4, §4.7)

### Required Pre-Body Elements (in order)

1. First-page header *(RPC-supplied; format per RFC 7841)*
2. Title
3. Abstract
4. RFC Editor/stream note *(optional, on request)*
5. Status of This Memo *(RPC-supplied)*
6. Copyright Notice *(RPC-supplied)*
7. Table of Contents *(RPC-supplied; required)*

**Rule:** Order of pre-body elements is **required**. TOC MUST follow Copyright Notice and precede the Introduction.

### Body Sections (strongly recommended order)

1. Introduction *(required; see §4.8.1)*
2. Requirements Language *(if RFC 2119/8174 keywords are used; see §4.8.2)*
3. Main body
4. IANA Considerations *(see §4.8.3)*
5. Internationalization Considerations *(if applicable; see §4.8.4)*
6. Security Considerations *(required; see §4.8.5)*
7. References *(see §4.8.6)*
8. Appendices *(labeled A, A.1, B, …)*
9. Acknowledgements *(optional)*
10. Contributors *(optional)*
11. Index *(if included)*
12. Author's Address *(required)*

**Numbering rules:**

- Pre-body elements: unnumbered.
- Body sections: numbered.
- Appendices: lettered (A, B, …).
- Post-appendix sections: unnumbered.

---

## First-Page Header (Source: §4.1)

Follow RFC 7841 format.

### Authors/Editors (§4.1.1)

- Stream decides who is listed.
- Names: initial(s) plus family name; variations acceptable.
- Keep names consistent across RFCs; authors may update names in later RFCs.
- Generally limit to **five individuals**.
- Header names MUST correspond to the Authors' Addresses section.
- Listed individuals sign off during AUTH48.

### Organization (§4.1.2)

- Affiliation on the line immediately after the author's name.
- Each author gets their own line.
- Shared affiliation MAY appear once after the group (unless it forces reordering).
- No affiliation → use "Independent," "Individual Contributor," "Retired," or similar, or leave a blank line.

### Identifiers (§4.1.3–§4.1.4)

| Identifier | Value / Rule |
|------------|-------------|
| ISSN | 2070-1721 (included by RFC Editor) |
| DOI prefix | 10.17487 (assigned and included by RFC Editor) |

### Updates/Obsoletes (§4.1.5)

- Use `Updates: nnnn` or `Obsoletes: nnnn`.
- Multiple numbers listed in **ascending order**.

---

## Title (Source: §4.2)

- Centered below the header; two blank lines before, one after.
- Must represent scope and purpose without being too general or too long.
- Expand abbreviations; parenthesized abbreviation after expansion is recommended.
- Private company protocols: use form "Foo's … Protocol."

---

## Abstract (Source: §4.3)

- **Mandatory.**
- Concise, comprehensive overview of document purpose/contents; must describe relationship to other RFCs (especially updates/obsoletes).
- Typically begins: "This memo" or "This document."
- MUST be self-contained; expand uncommon abbreviations.
- Mentions of other RFCs include the RFC number plus full or short title.
- **No in-text citations; no references to document sections.**
- Must mention any updated/obsoleted documents that carry important provisions.

---

## Notes and Status Sections (Source: §4.4–§4.6)

| Section | Rule |
|---------|------|
| Stream or RFC Editor Note (§4.4) | Optional; explains unusual publication circumstances or corrections |
| Status of This Memo (§4.5) | Supplied by RFC Editor per RFC 7841 and IAB format document |
| Copyright/Licenses (§4.6) | Full text maintained on IETF Trust Legal Provisions site |

---

## Body Sections — Detailed Rules (Source: §4.8)

### Introduction (§4.8.1)

- MUST be the first section after the TOC (except MIB module documents).
- MUST explain motivation and applicability.
- Alternatives to "Introduction": "Overview" or "Background."
- MIB documents: Internet-Standard Management Framework text is Section 1.

### Requirements Language (§4.8.2)

- If capitalized keywords (MUST, SHOULD, MAY, …) are used: cite RFC 2119 and RFC 8174 as **normative references**.
- Otherwise: specify the interpretation explicitly in the document.
- Place this section in the body, after or within the Introduction.
- Use keywords **sparingly** and only for interoperability or to limit potential harm.

### IANA Considerations (§4.8.3)

- Follow BCP 26.
- Use placeholders such as `TBD1` in both the IANA section and the body.
- RFC Editor verifies assigned values and queries authors through IANA if unclear.
- Use decimal or hexadecimal **consistently**.

### Internationalization (§4.8.4)

- Required for RFCs addressing internationalization.
- Follow BCP 18, Section 6.

### Security Considerations (§4.8.5)

- **Required in ALL RFCs.**
- Follow BCP 72.
- MIB and YANG modules require additional boilerplate.

### References (§4.8.6)

**General rules:**

- Entries only; no introductory text or annotations beyond necessary translations.
- Use one reference style consistently.
- Split into normative and informative subsections when both exist; order by citation tag, alphanumerically.
- If only one category exists, no subsection is needed.
- Normative references to Internet-Drafts **suspend publication** until the draft is ready.

**By reference type:**

| Type | Key formatting rules |
|------|---------------------|
| **RFCs (§4.8.6.1)** | Tag, author(s), title in quotes, stream, subseries number (if any), RFC number, DOI, date, URL. Last author has different name order from the others. |
| **STDs/BCPs/FYIs (§4.8.6.2)** | Use subseries number as citation tag. Include all RFCs in the group under one tag; cite specific RFC numbers in text. Include info-page URI. Keep existing FYI numbers. |
| **Internet-Drafts (§4.8.6.3)** | Informative only. Include posting month/year, full filename with version, phrase "Internet Draft," and a stable URL if available. If later published as RFC, list the RFC too. |
| **Errata (§4.8.6.4)** | Use erratum ID format. Do NOT reference errata in "Reported" state. |
| **IANA registries (§4.8.6.5)** | Either section. Format: tag, IANA, registry name, URL. |
| **Other SDOs (§4.8.6.6)** | Author-list format where authors are listed; organization format otherwise. Use abbreviated SDO name. IEEE dates not recommended unless citing a specific section. |
| **Webpages (§4.8.6.7)** | Most stable, directly reachable URL. Use dated URI if one exists. URL cannot be the only information. HTTPS preferred. |
| **Mailing list emails (§4.8.6.8)** | Tag, sender, subject line, list name, date, URL. |
| **Code repositories (§4.8.6.9)** | Informative only. Include title, commit hash or release marker, last-commit date, and URL. |

---

## Post-Body Sections (Source: §4.9–§4.13)

| Section | Rules |
|---------|-------|
| **Appendices (§4.9)** | References MUST precede appendices. Labels: "Appendix A. Title", "A.1. Title", "Appendix B. Title." |
| **Acknowledgements (§4.10)** | Optional. MAY be used alone or with Contributors. |
| **Contributors (§4.11)** | Optional. Stream decides who is listed. MAY describe contributions, list affiliations, include contact details (similar format to Author's Address). |
| **Index (§4.12)** | If included, placed at the end immediately before Author's Address. |
| **Author's Address (§4.13)** | **Required.** Long-lived email address is **mandatory**. Postal address and phone number optional. Country: use ISO 3166 English short name. Email munging prohibited. |

---

## Quick Constraint Reference

| Constraint | Rule |
|-----------|------|
| Language | English; American or British (consistent); mixed → American |
| Serial comma | Required |
| Citation tags | ASCII only; no spaces; square brackets |
| Cross-references | Section numbers, not page numbers |
| Citation ↔ reference | Every citation needs a reference and vice versa |
| Abstract | No citations, no section references; self-contained |
| Security section | Required in ALL RFCs |
| HTTPS vs HTTP | HTTPS strongly preferred |
| Color in figures | Prohibited (black on white only) |
| Email munging | Prohibited in Author's Address |
| Authors listed | Generally max 5 in header |
| ISSN | 2070-1721 (RFC Editor assigns) |
| DOI prefix | 10.17487 (RFC Editor assigns) |
| Updates/Obsoletes | RFC numbers in ascending order |
| I-D as normative ref | Suspends publication until draft is ready |

[^rfc7322bis]: RFC Style Guide (draft-rpc-rfc7322bis-02), IETF RFC Production Center
