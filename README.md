# Getting Started

## Create a Product Vision
Fill out [`docs/templates/product-vision.md`](./templates/product-vision.md) as best as possible and save it as [`/docs/product-vision.md`](./docs/product-vision.md)

## Create a Product Requirements Document
```text
@AGENTS.md Generate a baseline PRD in /docs using the "PRD Generator" skill based on @docs/product-vision.md and the manifesto principles in the AGENTS.md file.
```
Review and revise [`/docs/prd.md`](./docs/prd.md) as needed. Check [`/templates/prd-template.md`](./templates/prd-template.md) for additional guidance. Make sure to add any additional requirements that you think are necessary to fully define the product vision.

## Give your AI Agent the following instructions to get started:

First, generate the technical specifications:
```text
@AGENTS.md Generate a baseline SRS in /docs using the "SRS Writer" skill based on @docs/prd.md and the manifesto principles in the AGENTS.md file. 
```

Next, generate the initial Architecture Decision Records (ADRs):
```text
@AGENTS.md Generate Architecture Decision Record (ADR) files in /docs/architecture/ based on the technical decisions in @docs/prd.md and @docs/srs.md, following the conventions in @AGENTS.md. Be sure to include separate ADRs specifically for the choice of: 1) test runners, UI testing frameworks, Integration testing frameworks, Performance testing frameworks, and Test Reporting frameworks; 2) Inline code documentation and Developer documentation generation frameworks; and 3) Coding style standards and linting/formatting tools. Use tooling appropriate for the project's technology stack (e.g., pytest/pdoc/Ruff for Python). Based on the finalized technology stack, additionally generate a `.ai/rules/lint-enforce.md` rule file that specifies the exact CLI commands required to lint and format the codebase.
```

Finally, start with tests before coding:
```text
@AGENTS.md Generate Gherkin scenarios and feature files in @tests/features/ using the "Gherkin Writer" skill based on @docs/srs.md and @docs/prd.md.
```

## Generate an implementation plan to guide development
```text
@AGENTS.md Generate an implementation plan for the project using the "Implementation Plan Writer" skill based on the @docs/prd.md, @docs/srs.md and @tests/features/ feature files.
```

# Setup Development Environment

## Run the application

## Run tests

## Viewing Developer Documentation

# Setup Production Environment

## Deploy to Production

## Monitor and Update

