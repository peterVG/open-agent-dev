# About this project

*Note: These sections will be auto-populated by the AI Agent as more project information is confirmed.*

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

## Upload reference documents if you have any
Upload any reference documents to the `/docs/references/` directory. This includes technical specifications, API references, RFC documents, industry standards, academic papers, technical architecture documents, research papers, library documentation, framework guides, platform specifications, etc.

```text
@AGENTS.md read any reference documents in @docs/references/ and use the @.agents/skills/kb-synthesizer skill to generate a knowledge base in @.agents/kb/
```

## Create a Product Vision
Fill out [`docs/templates/product-vision.md`](./docs/templates/product-vision-template.md) as best as possible and save it as [`/docs/product-vision.md`](./docs/product-vision.md)

If you want AI Agent assistance to write the product vision document, you can invoke the bundled skill:
```text
/product-vision I want to build [XYZ]. Refer to the @.agents/kb/ folder for any relevant background information.
```

## Initialize the project

Open Agent Dev currently supports best practices for the Python/Javascript and BEAM/Elixir tech stacks.

```text
@AGENTS.md Initialize the project using the @.agents/skills/init-beam-elixir.md skill
```

OR

```text
@AGENTS.md Initialize the project using the @.agents/skills/init-python-js.md skill
```

## Create a Product Requirements Document

```text
@AGENTS.md Generate a prd.md in @docs using the @.agents/skills/prd-writer skill. Base it on @docs/product-vision.md, the @.agents/kb/ folder and the principles in the AGENTS.md file.
```
Review and revise [`/docs/prd.md`](./docs/prd.md) as needed. Check [`/docs/templates/prd-template.md`](./docs/templates/prd-template.md) for additional guidance. Make sure to add any additional requirements that you think are necessary to fully define the product vision.

## Create a Software Requirement Specification document and Architecture Decision Records

```text
@AGENTS.md Generate a srs.md in @docs using the @.agents/skills/srs-writer skill. Base it on @docs/prd.md, ADR files, BDD feature files and the principles in the AGENTS.md file. Use the @.agents/skills/feature-writer skill to generate BDD feature scenarios for each unique requirement in @docs/srs.md and @docs/prd.md. Use the @.agents/rules/adr-formatting.md rule to generate ADR files in the @docs/architecture-decisions/ folder based on the technical decisions in @docs/prd.md and @docs/srs.md. Populate the # About this project section of this README.md file with a description of the project based on the @docs/product-vision.md, @docs/prd.md, @docs/srs.md, ADR files and BDD feature files.
```

## Generate an implementation plan to guide development
```text
@AGENTS.md Generate an implementation plan for the project using the @.agents/skills/implementation-plan-writer skill based on the @docs/prd.md, @docs/srs.md, ADR files and BDD feature files. Once the implementation plan is created and the technology stack is confirmed, update the "Setup Development Environment" section in this README.md file with the actual commands needed to run the application, to execute tests, to view their results, and to view developer documentation. Be sure to be specific about what directory the user must be in to run the commands.
```

## Use the AGENTS.md prompts in your Implementation Plan
Check @docs/plan.md for specific task prompts in your implementation plan.These will guide you through the task list to generate and test your code in compliance with the Open Dev Agent principles and workflow.
