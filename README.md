# Getting Started

## Create a Product Vision
Fill out [`/templates/product-vision.md`](./templates/product-vision.md) as best as possible and save it as [`/docs/product-vision.md`](./docs/product-vision.md)

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
1. Clone the repository and navigate to the project root.
2. Initialize virtual environment: `python3 -m venv venv`
3. Activate virtual environment: `source venv/bin/activate` (`venv\Scripts\activate` on Windows)
4. Install Python dependencies: `pip install -r requirements.txt`
5. Install Allure CLI for test reporting:
   - **macOS:** `brew install allure`
   - **Linux:** `sudo apt-add-repository ppa:qameta/allure && sudo apt-get update && sudo apt-get install allure`
   - **Windows:** `scoop install allure` (Requires Scoop)


## Run the application
_Application entrypoint pending development..._


## Run tests
This project uses `pytest` for unit/integration/UI tests and `behave` for BDD Gherkin tests. Both export to the Allure framework.

1. **Execute Tests:**
   ```bash
   source venv/bin/activate
   pytest tests/unit/ --alluredir=tests/allure-results
   behave tests/features/ --format allure_behave.formatter:AllureFormatter --outfile tests/allure-results
   ```

2. **View Test Report:**
   ```bash
   allure serve tests/allure-results
   ```

## Viewing Developer Documentation
This project uses **Google Style Docstrings** and **pdoc** to generate interactive API documentation, as defined in `ADR-009`. 

From the project root, launch the documentation server without a build step:
```bash
pdoc src/ -p 8080
```

# Setup Production Environment

## Deploy to Production
_Deployment instructions pending..._

## Monitor and Update

