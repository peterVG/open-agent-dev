# About

An opionated AI Agent project template focused on docs-as-code development. It enforces a strict Branch-Per-Task workflow and Test-Driven Development (TDD). Designed to guide AI dev agents to comply with industry standards and best practices. Tech stack and AI agent neutral.

# Getting Started

## Create a Product Vision
Fill out [`docs/templates/product-vision.md`](./docs/templates/product-vision-template.md) as best as possible and save it as [`/docs/product-vision.md`](./docs/product-vision.md)

If you want AI Agent assistance to write the product vision document, you can invoke the bundled skill:
```text
/product-vision I want to build [XYZ]
```

## Create a Product Requirements Document
```text
@AGENTS.md Generate a baseline PRD in /docs using the "PRD Writer" skill based on @docs/product-vision.md, the uploaded files in @docs/references/, and the manifesto principles in the AGENTS.md file.
```
Review and revise [`/docs/prd.md`](./docs/prd.md) as needed. Check [`/templates/prd-template.md`](./templates/prd-template.md) for additional guidance. Make sure to add any additional requirements that you think are necessary to fully define the product vision.

## Give your AI Agent the following instructions to get started:

First, generate the technical specifications:
```text
@AGENTS.md Generate a baseline SRS in /docs using the "SRS Writer" skill based on @docs/prd.md and the manifesto principles in the AGENTS.md file. After generating the SRS, use the "Gherkin Writer" skill to generate Gherkin scenarios for each unique requirement in @docs/srs.md and @docs/prd.md.
```

Next, generate the initial Architecture Decision Records (ADRs):
```text
@AGENTS.md Generate Architecture Decision Record (ADR) files in /docs/architecture/ based on the technical decisions in @docs/prd.md and @docs/srs.md, following the conventions in @AGENTS.md. Be sure to include separate ADRs specifically for the choice of: 1) test runners, UI testing frameworks, Integration testing frameworks, Performance testing frameworks, and Test Reporting frameworks; 2) Inline code documentation and Developer documentation generation frameworks; and 3) Coding style standards and linting/formatting tools. Use tooling appropriate for the project's technology stack (e.g., pytest/pdoc/Ruff for Python). Based on the finalized technology stack, additionally generate a `.ai/rules/lint-enforce.md` rule file that specifies the exact CLI commands required to lint and format the codebase.
```

## Generate an implementation plan to guide development
```text
@AGENTS.md Generate an implementation plan for the project using the "Implementation Plan Writer" skill based on the @docs/prd.md, @docs/srs.md and @tests/features/ feature files. Once the implementation plan is created and the technology stack is confirmed, update the "Setup Development Environment" and "Setup Production Environment" sections in this README.md file with the actual commands needed to run the application, execute tests, view developer documentation, and deploy to production, removing the *Note:* placeholders.
```

# Setup Development Environment

*Note: These sections will be auto-populated by the AI Agent once the project's technology stack has been confirmed.*

## Run the application

## Run tests

## Viewing Developer Documentation

# Setup Production Environment

## Deploy to Production

## Monitor and Update


# When to add GitHub MCP
GitHub MCP (Model Context Protocol) is useful if Antigravity is interacting directly with GitHub APIs - things like creating issues, managing pull requests, reading repository metadata, etc.

For simpler workflows it's not necessary, because

-You're already using git commands successfully
-Your workflow is primarily local development with standard git push/pull
-The Antigravity template focuses on local-first development with docs-as-code

## Consider Github MCP to:

- Automate issue creation from design artifacts
- Have Antigravity create/manage pull requests directly
- Read GitHub Actions workflow results
- Manage repository settings or collaborators
- Query GitHub API data (stars, forks, contributors, etc.)
