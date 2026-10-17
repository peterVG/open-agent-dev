# Agent Skills 1.0 Compliance

This template follows the **Agent Skills 1.0 specification** (see [agent-skills-1.0.md](./kb/agent-skills-1.0.md)) to stay compatible with multiple AI coding assistants (e.g., Claude Code, Cursor, Codex).

## Directory Structure

```
.agents/
├── skills/                      # Reusable capabilities, one folder per skill
│   ├── vision-writer/           # Product vision drafting
│   ├── prd-writer/              # Product Requirements Document drafting
│   ├── requirements-extractor/  # Requirement extraction from source material
│   ├── srs-writer/              # Software Requirements Specification drafting
│   ├── architecture-writer/     # ISO 42010 system architecture document
│   ├── feature-writer/          # BDD / Gherkin feature files
│   │   └── SKILL-feature-writer.md  # Skill instructions (YAML + Markdown)
│   ├── plan-writer/             # Implementation plans
│   ├── kb-synthesizer/          # OKF knowledge-base concepts in kb/
│   ├── init-python-js/          # Python/JS stack initialization
│   ├── init-beam-elixir/        # BEAM/Elixir stack initialization
│   └── init-rust-js/            # Rust/JS (Axum + Tauri) stack initialization
├── rules/                       # Project-specific guardrails
│   └── sync-logic.md            # Documentation sync enforcement
├── scripts/                     # Task-specific helper scripts for agents
│   └── README.md                # Details on agent scripts
└── kb/                          # Synthesized AI knowledge base (OKF bundle)
    └── agent-skills-1.0.md      # Domain concepts for the AI
```

*Note: Raw technical specifications and whitepapers are kept in `resources/references/` rather than within `.agents/` to maintain a clear separation between project documentation and AI context.*

## Why `.agents/` instead of `.agent/`?

The `.agents/` directory is the convention used by this template, following Agent Skills 1.0, to provide:
- ✅ **Vendor neutrality** - Works across different AI coding assistants
- ✅ **Portability** - Skills can be shared between projects and tools
- ✅ **Discoverability** - One predictable location for agent instructions
- ✅ **Future-proof** - Aligned with emerging industry conventions

## Core Components

### 1. Skills (`.agents/skills/`)
**Reusable capabilities** that can be activated when needed.

**Example:** [`skills/feature-writer/SKILL-feature-writer.md`](./skills/feature-writer/SKILL-feature-writer.md)
- Translates SRS requirements into Gherkin scenarios
- Activated when the user asks for BDD feature files or Gherkin scenarios
- Can be copied to other projects

### 2. Rules (`.agents/rules/`)
**Project-specific guardrails** that are always enforced.

**Example:** [`rules/sync-logic.md`](./rules/sync-logic.md)
- Enforces consistency between PRD, SRS, Architecture, and Implementation Plan
- Always active - checked before any code is written
- Specific to this project's workflow

### 3. Knowledge Base (`.agents/kb/`)
**Synthesized domain knowledge** optimized for LLM conceptual understanding.
- Contains high-level summaries, established patterns, and project conventions.
- Loaded when the AI needs conceptual grounding (e.g., standard definitions, project vocabulary).

### 4. References (`resources/references/`)
**Raw technical specifications** for progressive disclosure.
- Contains deep API specs, protocol whitepapers, or large technical documents.
- Loaded *only* when a specific Skill explicitly requests it via its YAML frontmatter, saving tokens and improving accuracy for low-level tasks.

### 5. Scripts (`.agents/scripts/`)
**Task-specific helper scripts** that the AI agent can run using its shell or code-execution tool.
- Used to validate logic, simulate load, or perform automated checks without deploying code.
- Often executed by specific Skills to verify architecture decisions or calculations.
- The repository's verification gates live in the top-level [`scripts/`](../scripts/) directory, not here.

## Agent Skills 1.0 Format

Each skill follows this structure:

```markdown
---
name: skill-name
description: Brief description of what this skill does
---

# Skill Name

## Purpose
[What this skill accomplishes]

## When to Use This Skill
[Triggers for activation]

## Instructions
[Detailed guidance for the AI agent]
```

## Compatibility Matrix

Support varies by tool and version; check your assistant's current documentation.

| AI Assistant | `.agents/skills/` Support | `.agents/rules/` Support |
|--------------|----------------------|---------------------|
| Claude Code  | ✅ Full              | ✅ Full             |
| Cursor       | ✅ Full              | ⚠️ Partial          |
| GitHub Copilot | ⚠️ Limited         | ❌ No               |

## Migration from `.agent/`

If you have an existing project using `.agent/`, migrate to `.agents/`:

```bash
# Move skills
mv .agent/skills .agents/skills

# Move rules
mv .agent/rules .agents/rules

# Remove old directory
rmdir .agent
```

Then update all references in your documentation from `.agent/` to `.agents/`.

## Creating New Skills

1. Create a directory: `.agents/skills/<name>/`
2. Add `SKILL-<name>.md` with YAML frontmatter (this repository's naming convention)
3. (Optional) Add `assets/` for templates or examples
4. Reference in documentation

**Example:**
```
.agents/skills/api-generator/
├── SKILL-api-generator.md
└── assets/
    └── openapi-template.yaml
```

## Creating New Rules

1. Create a file: `.agents/rules/my-rule.md`
2. Write clear, enforceable guidelines
3. Reference in README or other docs

**Example:**
```markdown
# TypeScript-Only Rule

All new code MUST be written in TypeScript, not JavaScript.

## Enforcement
- Check file extensions (.ts, .tsx only)
- Reject .js files in pull requests
- Configure linter to enforce
```

## Benefits for AI-driven Development Projects

1. **Portability** - Use the same skills across different AI assistants
2. **Shareability** - Publish skills for the community
3. **Consistency** - Standard structure makes onboarding easier
4. **Vendor Independence** - Not locked into a single AI tool

## Learn More

- [Agent Skills 1.0 (project synthesis)](./kb/agent-skills-1.0.md)
- [Knowledge Base Bundle Guide](./kb/README.md)
