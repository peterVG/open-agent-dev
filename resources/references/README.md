# References Directory

This directory contains **technical documentation, whitepapers, and specifications** that the AI agent can reference when needed.

## Purpose

The `references/` directory implements **Progressive Disclosure** - the agent only loads these documents when a skill explicitly requires deep technical grounding, saving context window tokens.

## What Goes Here

### Technical Specifications
- Protocol documentation (e.g., the OAuth 2.0 specification)
- API references (e.g., a payment provider's REST API)
- RFC documents
- Industry standards

### Whitepapers
- Academic papers relevant to your domain
- Technical architecture documents
- Research papers

### Third-Party Documentation
- Library documentation
- Framework guides
- Platform specifications

## Example Structure

```
references/
├── payments-api/
│   ├── payments-api-overview.pdf
│   ├── charge-object.md
│   └── webhook-events.md
└── standards/
    ├── oauth2-rfc6749.md
    └── jwt-rfc7519.md
```

## How Skills Use References

Skills specify when to load references using a `references` field in their YAML frontmatter. This field is a convention of this project, not part of the Agent Skills specification; agents honour it because the skill instructions tell them to.

```yaml
---
name: architecture-writer
description: Creates system architecture based on technical specs
allowed-tools:
  - web_search
references:
  - resources/references/payments-api/payments-api-overview.pdf
  - .agents/kb/payments/payment-flows.md
---
```

**Progressive Disclosure in Action:**
- ✅ Agent only loads these files when the skill is activated
- ✅ Saves tokens when working on unrelated tasks
- ✅ Ensures accurate, up-to-date technical information

## vs. Knowledge Base (`.agents/kb`)

| Directory | Purpose | When Loaded |
|-----------|---------|-------------|
| `resources/references/` | Deep technical specs, loaded by skills | Only when skill is activated |
| `.agents/kb/` | Domain knowledge, loaded by user | When explicitly referenced with `@.agents/kb/file.md` |

**Rule of thumb:**
- Use `resources/references/` for **source material** that skills need automatically
- Use `.agents/kb/` for **domain knowledge** you want to reference manually

## Example: SRS Generation with References

```yaml
---
name: srs-writer
description: Creates Software Requirements Specification
allowed-tools:
  - web_search
references:
  - resources/references/payments-api/charge-object.md
  - .agents/kb/payments/payment-flows.md
---

# SRS Writer Skill

When generating an SRS for online payments:
1. Read the PRD for business requirements
2. Load resources/references/payments-api/charge-object.md for technical constraints
3. Use web_search to verify current library versions
4. Generate SRS with accurate technical specifications
```

## Best Practices

### 1. Keep Files Focused
One topic per file. Don't create massive reference documents.

**Good:**
- `payments-api-charge-object.md`
- `payments-api-webhook-events.md`

**Bad:**
- `payments-api-everything.md`

### 2. Use Standard Formats
- Markdown (`.md`) for text documentation
- PDF for official whitepapers
- JSON/YAML for structured data

### 3. Include Metadata
Add a header to each reference file:

```markdown
# Payments API: Charge Object

**Source:** https://example.com/docs/payments-api/charges
**Version:** 2.7
**Last Updated:** 2026-01-15
**Relevant To:** Checkout, refunds

[Content...]
```

### 4. Version Control
Keep references up to date. When a spec changes:
1. Update the reference file
2. Update the "Last Updated" date
3. Commit with a clear message

## Progressive Disclosure Benefits

For agents with large context windows:
- **Token Efficiency:** Don't load 50-page specs unless needed
- **Accuracy:** Agent uses current, verified information
- **Focus:** Agent only sees relevant technical details for the current task

## Example Workflow

```
USER: Generate an SRS for online payments using the payments API

AGENT: [Activates srs-writer skill]
AGENT: [Skill specifies resources/references/payments-api/charge-object.md]
AGENT: [Loads ONLY that reference file]
AGENT: [Uses web_search to verify the current SDK version]
AGENT: [Generates SRS with accurate technical constraints]
```

Without progressive disclosure, the agent would load ALL references upfront, wasting tokens on irrelevant specs.
