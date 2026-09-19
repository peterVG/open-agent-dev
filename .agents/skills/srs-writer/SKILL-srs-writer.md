---
name: SRS Writer
description: Creates Software Requirements Specification from PRD, technical references, and UI mockups
allowed-tools:
  - google_search
  - code_interpreter
references:
  - resources/ui-mockups/
---

# SRS Generator Skill

## Purpose

This skill generates a Software Requirements Specification (SRS) from a Product Requirements Document (PRD), using technical references and UI mockups in `resources/ui-mockups/` to ensure accuracy and up-to-date specifications. Mockups are informative design sources; the SRS text is normative.

## When to Use This Skill

- When asked to "Generate an SRS"
- When translating PRD business requirements into technical specifications
- When the user references this skill explicitly

## Progressive Disclosure

This skill demonstrates **progressive disclosure** by:
1. **Loading references only when activated** - Saves tokens when working on other tasks
2. **Using google_search** - Verifies current library versions (e.g., latest Arweave.js)
3. **Using code_interpreter** - Validates technical calculations (e.g., storage costs)

## Workflow

### Step 1: Read the PRD
```
AGENT: [Reads @resources/prd.md]
AGENT: [Identifies core features and business requirements]
```

### Step 2: Load Technical References
```
AGENT: [Loads @.agents/kb/rfc-2119-req-terms.md and @.agents/kb/iso-29148-srs.md for standards definitions]
AGENT: [Loads relevant reference files from the @resources/references/ folder]
AGENT: [Now has deep technical grounding]
```

### Step 3: Read UI Mockups
```
AGENT: [Lists and reads every file in @resources/ui-mockups/, including images, HTML, PDF, and accompanying notes. Skip only the directory README if it contains no mockup.]
AGENT: [Extracts UI features: required surfaces, information shown, primary actions, navigation, and states (empty, loading, error, offline, permission-denied).]
AGENT: [Extracts look-and-feel as measurable constraints: layout regions (presence and purpose, not pixel coordinates), visual hierarchy, control density, typography scale, color roles, and contrast.]
AGENT: [Does NOT write screenshot-match or pixel-identical acceptance. Does NOT copy subjective language such as "clean" or "modern" unless restated as a testable constraint.]
AGENT: [If a mockup contradicts @resources/prd.md, HALT and report the conflict before generating the SRS.]
AGENT: [If a mockup shows a surface or state with no PRD ID, still specify it, cite the mockup, and record the PRD gap in the traceability matrix.]
```

### Step 4: Verify Current Versions
```
AGENT: [Uses google_search to ensure SRS uses the most current versions of software libraries and references]
```

### Step 5: Validate Constraints
```
AGENT: [Checks @resources/prd.md for budget, technical and other constraints]
AGENT: [Verifies that technical approach meets all constraints from PRD]
```

### Step 6: Generate SRS
```
AGENT: [Creates resources/srs.md]
AGENT: [Maps all PRD requirements to the SRS using a dedicated **Source** section at the end of each requirement block. Format: `- [[source ID]](../prd.md) [source name]`]
AGENT: [Converts UI features and look-and-feel from @resources/ui-mockups/ into explicit SRS requirement blocks. Each UI-derived requirement MUST be testable, use RFC 2119 keywords, and cite the mockup with a relative link (e.g. `- [library-grid.png](./ui-mockups/library-grid.png)`). When the mockup implements a PRD feature, cite both the PRD ID and the mockup.]
AGENT: [Look-and-feel requirements MUST state measurable visual constraints (regions, hierarchy, density, typography, color roles, contrast). They MUST NOT require the running UI to match a mockup screenshot.]
AGENT: [**CRITICAL**: Do not omit Non-Functional Requirements (NFRs) or Technical Constraints (TCs). Every single item in the PRD—including architecture rules, performance limits, and framework restrictions—MUST be mapped 1:1 to an explicit SRS requirement block to guarantee 100% forward traceability.]
AGENT: [Ensures forward-traceability by defining an expected **Tests** section mapping to all target Gherkin, integration, performance, ui, and unit test files. Format MUST respect the monorepo bounds defined in `.agents/rules/workspace-boundaries.md` by dynamically mapping to the active technology stack's idiomatic isolated testing vocabulary (e.g. `- [[filename]](../apps/backend/tests/features/[filename])` for Python/JS tracking, or `- [[filename]](../apps/my_app_web/test/features/[filename])` for BEAM/Elixir tracking)]
AGENT: [Behavioral UI features map to BDD scenarios. Look-and-feel and presentation constraints map to UI tests with explicit assertions. If an SRS requirement cannot be validated via a standard BDD feature file (e.g., overarching NFRs, Technical Constraints, or visual constraints), the **Tests** block MUST define alternative automated verification strategies locally. Examples include: CI/CD configuration files, static code analysis tools, locus testing bounds, or explicit UI assertions.]
AGENT: [Ensures SRS strictly complies with ISO/IEC/IEEE 29148 (Unambiguous, Complete, Verifiable, Consistent, Traceable)]
AGENT: [Uses "MUST" or "MUST NOT" for mandatory requirements and "SHOULD" or "SHOULD NOT" for optional requirements per RFC 2119]
AGENT: [Includes accurate library versions and technical constraints]
```

### Step 7: Verify Traceability
```
AGENT: [Cross-references every F-XXX, NFR-XXX, and TC-XXX identifier listed in the PRD against the newly generated SRS document.]
AGENT: [Cross-references every mockup in @resources/ui-mockups/ (except the directory README) against the SRS. Each mockup MUST appear in at least one Source block, or the agent MUST halt and explain why it was unused.]
AGENT: [If any PRD identifier is missing from the SRS, the agent MUST halt, append the missing requirements, and regenerate the mapping before completing the task.]
AGENT: [Conclude the task by appending a Summary Traceability Matrix or checklist ensuring 100% PRD coverage and mockup coverage.]
```

## Example Output

**From PRD:**
```markdown
## Feature: File Upload
Users should be able to upload datasets up to 500MB for permanent storage.
Budget: $100/month for storage costs.
```

**Generated SRS:**
```markdown
# SRS-UPLOAD-001: File Upload Service

## Functional Requirements

### SRS-UPLOAD-001.1: File Size Support
The system MUST support file uploads up to 500MB.

**Technical Implementation:**
- Use Arweave.js v1.14.4 (verified via google_search)
- Chunk files larger than 100MB per Arweave transaction limits
- Transaction format per references/arweave/transaction-format.md

**Source**
- `[prd.md](../prd.md)` F-001 File Upload

**Tests**
- [`large_file_upload_SRS-UPLOAD-001.feature`](../tests/features/large_file_upload_SRS-UPLOAD-001.feature)

### SRS-UPLOAD-001.2: Permanent Storage
Files MUST be stored permanently on Arweave.

**Cost Validation:**
- Executed scripts/validation/calculate_storage_fees.py
- Estimated cost: $0.005/MB = $2.50 per 500MB file
- 40 files/month = $100/month ✅ Within budget

**Source**
- `[prd.md](../prd.md)` F-001 File Upload

**Tests**
- [`large_file_upload_SRS-UPLOAD-001.feature`](../tests/features/large_file_upload_SRS-UPLOAD-001.feature)

### SRS-UPLOAD-001.3: Chunking Strategy
Files larger than 100MB MUST be chunked.

**Technical Specification:**
- Chunk size: 100MB (per Arweave transaction limits)
- Use AO message passing for chunk coordination (per references/ao/message-passing.md)
- Implement resumable uploads per SRS-PERF-003

**Source**
- `[prd.md](../prd.md)` F-001 File Upload

**Tests**
- [`large_file_upload_SRS-UPLOAD-001.feature`](../tests/features/large_file_upload_SRS-UPLOAD-001.feature)

### SRS-UPLOAD-001.4: Upload Progress Presentation
The upload surface MUST show transfer progress as a percentage while a file is uploading, and MUST show a success confirmation when the upload completes.

**Source**
- `[prd.md](../prd.md)` F-001 File Upload
- `[upload-progress.png](./ui-mockups/upload-progress.png)`

**Tests**
- [`upload_progress_SRS-UPLOAD-001.feature`](../tests/features/upload_progress_SRS-UPLOAD-001.feature)
```

## Benefits of Progressive Disclosure

### Without Progressive Disclosure
```
AGENT: [Loads ALL references upfront: 50 pages of Arweave docs]
AGENT: [Loads ALL references upfront: 30 pages of AO specs]
AGENT: [Loads ALL references upfront: OAuth, JWT, etc.]
AGENT: [Context window: 80% full before even starting]
AGENT: [Hallucinates library versions because context is full]
```

### With Progressive Disclosure
```
AGENT: [Loads ONLY Arweave and AO references - 10 pages]
AGENT: [Context window: 20% full]
AGENT: [Uses google_search for current versions]
AGENT: [Accurate SRS with verified technical specs]
```

## Integration with AI Agent Workflow

```
USER: @AGENTS.md Generate a baseline SRS in @resources based on @resources/prd.md, @resources/ui-mockups/, and the manifesto principles in the AGENTS.md file. Use the "Gherkin Writer" skill to generate Gherkin scenarios for each unique requirement in @resources/srs.md and @resources/prd.md
AGENT: [Activates SRS Generator skill]
AGENT: [Reads AGENTS.md for AI Agent principles]
AGENT: [Reads resources/prd.md for business, functional and non-functional requirements and constraints]
AGENT: [Loads @resources/references for technical specifications and context]
AGENT: [Reads @resources/ui-mockups/ and converts UI features and look-and-feel into testable SRS requirements]
AGENT: [Uses google_search to verify current library versions]
AGENT: [Creates resources/srs.md with accurate technical specifications]
AGENT: [Activates Gherkin Writer skill]
AGENT: [Creates Gherkin .feature files in the tests/features folder for each unique requirement in resources/srs.md and resources/prd.md]
```

## Success Criteria

A well-generated SRS should:
- ✅ Strictly comply with ISO/IEC/IEEE 29148: Unambiguous, Complete, Verifiable, Consistent, and Traceable requirements
- ✅ Strictly comply with RFC 2119: "MUST" or "MUST NOT" for mandatory requirements and "SHOULD" or "SHOULD NOT" for optional requirements
- ✅ Map 100% of PRD items (Features, Non-Functional Requirements, and Technical Constraints) mathematically to numbered SRS technical requirements
- ✅ Convert UI features and look-and-feel from `resources/ui-mockups/` into testable SRS requirements, with each mockup cited and no screenshot-match acceptance
- ✅ Use current, verified library versions (not hallucinated)
- ✅ Include technical constraints from prd.md and reference documents
- ✅ Validate costs/performance with executable scripts
- ✅ Follow Antigravity principles from AGENTS.md
- ✅ Guarantee full forward-traceability without data loss from the primary PRD and from UI mockups
