# About this project

# Setup Development Environment

## Run the application

## Run tests

## View logs

## Viewing Developer Documentation

# Setup Production Environment

## Deploy to Production

## Monitor and Update

---

# About Open Agent Dev

This project has been created using Open Agent Dev, an opionated AI Agent project template focused on docs-as-code development. 

It enforces a strict Branch-Per-Task workflow and Test-Driven Development (TDD). Designed to guide AI dev agents to comply with industry standards and best practices. Tech stack and AI agent neutral.

# Getting Started with Open Agent Dev

## Clone this repo
`git clone` this repository to your local development machine. Then delete the existing `.git` directory and run a `git init` to start a new project using the resources in this Open Agent Dev repo as your starting scaffold. 

## Upload reference documents if you have any
Upload any reference documents to the [`resources/references/`](./resources/references/) directory. This includes technical specifications, API references, RFC documents, industry standards, academic papers, technical architecture documents, research papers, library documentation, framework guides, platform specifications, etc.

```text
@AGENTS.md read any reference documents in @resources/references/ and use the @.agents/skills/kb-synthesizer skill to generate a knowledge base in @.agents/kb/
```
## Create a Product Vision
Fill out the [product vision template](./resources/templates/product-vision-template.md) as best as possible and save it as [`resources/product-vision.md`](./resources/product-vision.md).

If this is a product for a non-profit project, use the [alternate template](./resources/templates/product-vision-template-non-profit.md) to create a product vision document.

If you want AI Agent assistance to write the product vision document, you can invoke the bundled skill:
```text
/product-vision I want to build [XYZ]. Refer to the @.agents/kb/ folder for any relevant background information.
```

## Create a Product Requirements Document

```text
@AGENTS.md Generate a prd.md in @resources using the @.agents/skills/prd-writer skill. Base it on @resources/product-vision.md, the @.agents/kb/ folder and the principles in the AGENTS.md file.
```
Review and revise [`resources/prd.md`](./resources/prd.md) as needed. Check the [PRD template](./resources/templates/prd-template.md) for additional guidance. Make sure to add any additional requirements that you think are necessary to fully define the product vision.

## Initialize the project

Open Agent Dev currently supports best practices for the Python/Javascript, Rust/Javascript, and BEAM/Elixir tech stacks.

```text
@AGENTS.md Initialize the project using the @.agents/skills/SKILL-init-beam-elixir.md skill, the technical stack decisions in @resources/prd.md and the principles in the AGENTS.md file.
```
OR
```text
@AGENTS.md Initialize the project using the @.agents/skills/SKILL-init-rust-js.md skill, the technical stack decisions in @resources/prd.md and the principles in the AGENTS.md file.
```


OR

```text
@AGENTS.md Initialize the project using the @.agents/skills/SKILL-init-python-js.md skill, the technical stack decisions in @resources/prd.md and the principles in the AGENTS.md file.
```

## Add UI mockups and examples

Store wireframes, mockups, flows, and look-and-feel examples in [`resources/ui-mockups/`](./resources/ui-mockups/). Each file is a hard look-and-feel requirement for the surface it shows. Outcome-level product needs stay in [`resources/prd.md`](./resources/prd.md). See [`resources/ui-mockups/README.md`](./resources/ui-mockups/README.md) for what to include and how they are recorded as requirements.

## Create a Software Requirement Specification document and Architecture Decision Records

```text
@AGENTS.md Generate a srs.md in @resources [or @apps/app_123/resources] using the @.agents/skills/srs-writer skill. Base it on @resources/prd.md, the UI mockups and examples in @resources/ui-mockups/, and the principles in the AGENTS.md file. Treat every file in @resources/ui-mockups/ as a hard look-and-feel requirement. Record the surfaces, information, states, interactions, and the composition a person sees: regions and what sits in each, what is visible without scrolling, grouping, hierarchy, density, typography scale, colour roles, control shape, and which status text is shown or withheld. Write those as RFC 2119 requirements that comply with ISO/IEC/IEEE 29148, and cite each mockup in the Source block. A pixel or two of browser rendering difference is acceptable. Do not require a screenshot hash, and do not write that the page need not match the mockup. Use the @.agents/rules/adr-formatting.md rule to generate ADR files in the @resources/architecture/ folder based on the technical decisions in @resources/prd.md and @resources/srs.md. Populate the # About this project section of this README.md file with a description of the project based on the @resources/product-vision.md, @resources/prd.md, @resources/srs.md, ADR files and BDD feature files.
```
Review and revise [`resources/srs.md`](./resources/srs.md) as needed. Presentation and look-and-feel requirements extracted from mockups MUST follow each mockup's composition and MUST be testable. A pixel or two of browser rendering difference is acceptable. A screenshot hash is not required. A requirement that can pass while the page looks unlike the mockup is incomplete.

## Generate an implementation plan to guide development
### The "Global Holistic Execution" Prompt
Use this when you have updated the core PRD or added entirely new modules to a monorepo and need the AI to synthesize everything across the entire project from scratch.
```text
@AGENTS.md Invoke the @plan-writer skill. Delete any existing \plan.md` files across the repository. Then, rigorously analyze @resources/prd.md, @resources/srs.md if it exists, all `srs.md` configurations in the `apps/` directory, and the @resources/architecture/ records. Synthesize these requirements and generate the global roadmap at `resources/plan.md`, sequentially followed by granular module-specific checklists distributed strictly into each app's respective `apps/[Module Name]/resources/plan.md` location.`
```

### The "Single Module Focus" Prompt
Use this when you've just drilled down into defining a specific app in a monorepo (e.g., you heavily updated apps/app_123/resources/srs.md) and just want to regenerate that specific localized checklist without touching the global roadmap or other apps.

```text
@AGENTS.md Please invoke the @plan-writer skill to generate an implementation plan strictly for the \app_123` module. Read its specific @apps/app_123/resources/srs.md, the global @resources/prd.md, and relevant ADRs, and output the tracking checklist directly into @apps/app_123/resources/plan.md.`
```

## Use the AGENTS.md prompts in your Implementation Plan
Check @resources/plan.md for specific task prompts in your implementation plan.These will guide you through the task list to generate and test your code in compliance with the Open Dev Agent principles and workflow.

## NOTE: Branch-per-task enforcement
A branch-per-task workflow is strictly enforced to ensure all code is reviewed before merging. Direct commits to the `main` branch is blocked by local pre-commit hooks.

If you are a human developer and absolutely must push a hotfix directly to `main`, you can override this safeguard by prefixing your commit command:

```bash
FORCE_MAIN_COMMIT=1 git commit -m "emergency hotfix"
```
