# About this project

*Note: This section will be auto-populated by the AI Agent once the project vision and product requirements have been confirmed.*

# About Open Agent Dev

This project has been created using Open Agent Dev, an opionated AI Agent project template focused on docs-as-code development. 

It enforces a strict Branch-Per-Task workflow and Test-Driven Development (TDD). Designed to guide AI dev agents to comply with industry standards and best practices. Tech stack and AI agent neutral.

# Getting Started with Open Agent Dev

## Upload reference documents if you have any
Upload any reference documents to the `/docs/references/` directory. This includes technical specifications, API references, RFC documents, industry standards, academic papers, technical architecture documents, research papers, library documentation, framework guides, platform specifications, etc.

```text
@AGENTS.md read any reference documents in @docs/references/ and use the @.agents/skills/kb-synthesizer skill to generate a knowledge base in @.agents/kb/
```

## Initialize the project

Open Agent Dev currently supports Python/Javascript and BEAM/Elixir tech stacks.

```text
@AGENTS.md Initialize the project using the @.agents/skills/beam-elixir-init.md skill
```

OR

```text
@AGENTS.md Initialize the project using the @.agents/skills/python-js-init.md skill
```




## Create a Product Vision
Fill out [`docs/templates/product-vision.md`](./docs/templates/product-vision-template.md) as best as possible and save it as [`/docs/product-vision.md`](./docs/product-vision.md)

If you want AI Agent assistance to write the product vision document, you can invoke the bundled skill:
```text
/product-vision I want to build [XYZ]. Refer to the @.agents/kb/ folder for any relevant background information.
```

## Create a Product Requirements Document

```text
@AGENTS.md Generate a baseline product requirements document in /docs using the @. skill based on @docs/product-vision.md, the @.agents/kb/ folder and the manifesto principles in the AGENTS.md file.
```
Review and revise [`/docs/prd.md`](./docs/prd.md) as needed. Check [`/docs/templates/prd-template.md`](./docs/templates/prd-template.md) for additional guidance. Make sure to add any additional requirements that you think are necessary to fully define the product vision.

## Create a Software Requirement Specification document and feature files

```text
@AGENTS.md Generate a baseline SRS in /docs using the @.agents/skills/srs-writer skill based on @docs/prd.md and the manifesto principles in the AGENTS.md file. After generating the SRS, use the @.agents/skills/gherkin-writer skill to generate Gherkin scenarios for each unique requirement in @docs/srs.md and @docs/prd.md.
```

## Next, generate the initial Architecture Decision Records (ADRs):
```text
@AGENTS.md Generate Architecture Decision Record (ADR) files in @docs/architecture/ folder based on the technical decisions in @docs/prd.md and @docs/srs.md, following the conventions in @AGENTS.md. Be sure to include separate ADRs specifically for the choice of: 1) test runners, UI testing frameworks, Integration testing frameworks, Performance testing frameworks, and Test Reporting frameworks; 2) Inline code documentation and Developer documentation generation frameworks; and 3) Coding style standards and linting/formatting tools. Use tooling appropriate for the project's technology stack (e.g., pytest/pdoc/Ruff for Python). Based on the finalized technology stack, additionally generate a @.agents/rules/lint-enforce.md rule file that specifies the exact CLI commands required to lint and format the codebase.
```

## Generate an implementation plan to guide development
```text
@AGENTS.md Generate an implementation plan for the project using the @.agents/skills/implementation-plan-writer skill based on the @docs/prd.md, @docs/srs.md and @tests/features/ feature files. Once the implementation plan is created and the technology stack is confirmed, update the "Setup Development Environment" and "Setup Production Environment" sections in this README.md file with the actual commands needed to run the application, execute tests (including BDD feature tests specifically), generate and view test reports (e.g. Allure), view developer documentation, and deploy to production, removing the *Note:* placeholders.
```

## Use the AGENTS.md prompts in your Implementation Plan
Check @docs/plan.md for specific task prompts in your implementation plan.These will guide you through the task list to generate and test your code in compliance with the Open Dev Agent principles and workflow.

# Setup Development Environment

*Note: These sections will be auto-populated by the AI Agent once the project's technology stack has been confirmed.*

## Run the application

## Run tests

## Viewing Developer Documentation

# Setup Production Environment

## Deploy to Production

## Monitor and Update
