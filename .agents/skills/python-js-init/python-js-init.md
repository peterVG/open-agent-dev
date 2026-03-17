---
description: Initialize a new Python/Javascript project with best practice root directory structure
---

# Python/Javascript Project Initialization

This skill guides the AI agent to initialize a new Python/Javascript project with the optimal directory structure, separating the frontend and backend, orchestrated by Docker.

## Step 1: Scaffold the Root Directory Structure

When scaffolding a new project, you MUST create the following directory structure at the root, while keeping all the files and folders that are currently also in the root directory.

```text
project-root/
├── docker-compose.yml 
├── .env 
├── .gitignore 
├── requirements.txt 
├── README.md
├── apps/ 
│   ├── frontend/            
│   │   ├── package.json     
│   │   ├── public/          
│   │   ├── src/             
│   │   │   ├── App.jsx      
│   │   │   ├── components/  
│   │   │   └── api/         
│   │   └── Dockerfile       
│   │
│   └── backend/             
│       ├── requirements.txt 
│       ├── Dockerfile       
│       └── app/             
│           ├── main.py      
│           ├── models/      
│           ├── routers/     
│           ├── database.py  
│           └── tasks/  
├── tests/     
└── packages/                
    └── shared-config/       
```

Use appropriate system commands (`mkdir`, `touch`, etc) to generate this exact hierarchy. Ensure you populate the initial files like `.gitignore`, `docker-compose.yml`, and `Dockerfile` based on standard best practices for the specific frameworks you select for the frontend and backend inside these directories.

### Populate the README.md file to explain directory structure

Populate the README.md file to explain the directory structure. Use the following verbatim text:

For a Python/Javascript project, the best practice is a Monorepo approach that strictly separates the backend API (Python) from the frontend client application (Javascript/TypeScript).

The Standard Monorepo Pattern: In a dedicated monorepo, the apps/ folder is typically used to house all independent, deployable applications in the project, regardless of whether they are client-side or server-side. eg, apps/frontend (a React frontend) and apps/backend (an Express backend) sitting side-by-side.

Unified Workspace Management: By treating the Python API as just another "app" within the workspace, modern monorepo tools can orchestrate tasks, cache builds, and run pipelines across both the frontend and backend uniformly without needing custom directory targeting.

Co-locating Backend Logic: Putting the entire Python backend (both the web API and background workers like Celery) into a single apps/backend/ directory follows the best practice of co-locating web and worker nodes. Housing these together creates a synergy that allows them to seamlessly share components like database models and services, which fosters code reusability and prevents inconsistencies.

```text
project-root/
├── docker-compose.yml       # Orchestrates the full stack (Frontend, Backend, DB, Workers) 
├── .env                     # Secure storage for environment variables (DB credentials, API keys) 
├── .gitignore               # Ignores dependencies and secrets (e.g., node_modules, .venv) 
├── requirements.txt         # Development dependencies (testing, building, documentation)
├── README.md                # Project documentation, setup instructions, and examples
├── apps/                    # Core applications (Monorepo approach) 
│   ├── frontend/            # JavaScript/TypeScript Client (e.g., React, Vue) 
│   │   ├── package.json     # Node dependencies 
│   │   ├── public/          # Static web assets 
│   │   ├── src/             # Main frontend source code
│   │   │   ├── App.jsx      # Main UI component 
│   │   │   ├── components/  # Reusable UI elements 
│   │   │   └── api/         # API client layer to fetch data from the Python backend 
│   │   └── Dockerfile       # Frontend container configuration 
│   │
│   └── backend/             # Python API (e.g., FastAPI, Django, Flask) 
│       ├── requirements.txt # Python dependencies 
│       ├── Dockerfile       # Backend container configuration 
│       └── app/             # Main Python source code 
│           ├── main.py      # Entry point for the server 
│           ├── models/      # Database definitions and schemas 
│           ├── routers/     # API endpoints and route handlers 
│           ├── database.py  # Database connection setup 
│           └── tasks/       # Background workers (e.g., Celery tasks) 
├── tests/                   # Test suites, ExUnit/EUnit files, and test helpers 
└── packages/                # Shared monorepo packages 
    └── shared-config/       # Shared configs (e.g., TypeScript, Prettier, ESLint) 
```

When writing or configuring code for this stack, you must adhere to the following principles:

**Complete Separation**: The frontend and backend run on different ports during development (e.g., React on 5173, FastAPI on 8000) and are completely isolated. The frontend doesn't need to know the backend is written in Python; it simply makes standard HTTP requests (GET, POST, PUT, DELETE) and receives JSON in return.
**The Backend (Python)**: For maintainability, the backend organizes code into logical modules like `routers/` for endpoints, `models/` for database interactions, and `tasks/` for asynchronous background jobs.
**The Frontend (JavaScript)**: Client-side code is grouped into a `src/` directory containing view `components/` and an `api/` layer specifically responsible for handling all communication with the backend.
**Docker Integration**: Utilizing a `docker-compose.yml` file at the root, along with individual `Dockerfile`s in the backend and frontend folders, standardizes the development environment across the team and minimizes "it works on my machine" issues.
**Environment Variables**: An `.env` file at the root securely stores sensitive configuration data so it is loaded safely via tools like `python-decouple` or `dotenv` instead of hardcoding secrets into the repository.

## Step 2: Configure Testing Frameworks

The main test execution environment is driven by `pytest`, supported by various plugins and external tools.

## Tools and Frameworks

### 1. Core Testing Framework: `pytest`
- **Purpose**: Extensively used for writing and executing unit, integration, and UI tests.
- **Configuration**: Managed via `pytest.ini` at the root directory.
  - Automatically targets `tests/unit`, `tests/integration`, and `tests/ui`.
  - Uses a dedicated cache directory at `tests/.pytest_cache`.
- **References in `requirements.txt`**: `pytest`, `pytest-vcr`.

### 2. HTTP Request Mocking: `pytest-vcr` / `vcrpy`
- **Purpose**: Used for capturing and replaying HTTP interactions, allowing tests to run quickly and deterministically without hitting live endpoints.

### 3. Behavior-Driven Development (BDD): `behave`
- **Purpose**: Used for writing tests in domain-specific language (Gherkin syntax).
- **Location**: BDD test definitions reside under `tests/features`.
- **References in `requirements.txt`**: `behave`, `cucumber-expressions`, `cucumber-tag-expressions`.

### 4. Performance Testing: `locust`
- **Purpose**: Used to simulate user loads and measure system limitations and responsiveness under stress.
- **Location**: Performance scripts reside under `tests/performance`.
- **References in `requirements.txt`**: `locust`.

### 5. Test Reporting: `allure`
- **Purpose**: Generates interactive and highly detailed test execution reports.
- **Integration**: Plugs into both pytest (`allure-pytest`) and behave (`allure-behave`).
- **Configuration**: Results are configured to output to `tests/allure-results` via `--alluredir=tests/allure-results` in `pytest.ini`.

### 6. Code Formatting and Linting (Python Backend): `ruff`
- **Purpose**: Ensures code quality and standard style before testing.
- **Configuration**: Defined in `pyproject.toml` targeting modern Python features.

### 7. Code Formatting and Linting (Javascript Frontend): `eslint` & `prettier`
- **Purpose**: Enforces code quality and formatting consistency for the Javascript/TypeScript frontend codebase.
- **Configuration**: Defined in the frontend `package.json` and `.eslintrc.json`/`.prettierrc.json` within `apps/frontend/`.

## Directory Structure

The `tests/` directory is logically partitioned based on testing scope:
- `tests/unit/`: Focused, isolated tests for individual functions and classes.
- `tests/integration/`: Tests verifying interactions between multiple components or modules.
- `tests/ui/`: Tests dedicated to user interface workflows.
- `tests/features/`: BDD feature files and step definitions (`behave`).
- `tests/performance/`: Load testing scripts (`locust`).
- `tests/allure-results/`: Directory capturing real-time test output for Allure reporting.

## Best Practices
- Run code formatting and linting via `ruff` (backend) and `eslint`/`prettier` (frontend) prior to running tests.
- Execute unit and integration tests via `pytest`.
- Execute performance limits via `locust`.
- Execute behavior feature maps via `behave`.
- After a test run, compile `allure` results using the Allure CLI to generate viewable test coverage HTML reports.

## Step 3: Configure Documentation Generation

Clear documentation is critical for maintaining the separation of concerns in a monorepo. Configure the following documentation frameworks:

1. **Backend (Python):** Use `pdoc` to automatically extract docstrings (which MUST follow Google or NumPy style) and generate API documentation. Add `pdoc` to your development `requirements.txt`.
2. **Frontend (Javascript):** Use `JSDoc` for inline comments and function signatures. If the frontend grows complex, configure `TypeDoc` (if using TypeScript) or `JSDoc`'s generator to produce static documentation sites.

## Step 4: Generate Inline Documentation Rule

Create a @.agents/rules/docs-enforce.md file that contains the following verbatim content:

---
description: Ensure all code is comprehensively documented using the standard inline documentation formats for this stack.
---

# Inline Documentation Enforcement

**Purpose:** This rule dictates how an AI agent MUST document the codebase to satisfy the Inline Documentation Mandate in `AGENTS.md`.

## Active Enforcement

Before declaring any coding task "complete" or writing tests, the agent MUST verify that the following components include verbose inline documentation that clearly explains their function and intended usage:

1.  **ALL** Classes
2.  **ALL** Functions / Methods
3.  **ALL** Modules
4.  **ALL** Complex or non-obvious code blocks

### Python (Backend) Standards
The agent MUST use standard Python docstrings (using `"""`) adhering strictly to either the **Google** or **NumPy** docstring format.
These docstrings MUST be parseable by `pdoc` to generate the final developer documentation site.

### Javascript/TypeScript (Frontend) Standards
The agent MUST use standard `JSDoc` syntax (using `/** ... */`) for all frontend logic, hooks, utility functions, and complex React/Vue components.

*Failure to document code according to these standards violates the core AGENTS.md manifesto.*

## Step 5: Generate linting rule

Create a @.agents/rules/lint-enforce.md file that contains the following verbatim content:  

---
description: Ensure all code is strictly linted and formatted before pushing or testing.
---

# Linting and Formatting Enforcement

**Purpose:** This file instructs the AI agent on exactly how to lint and format the codebase to satisfy the Test-Driven Development (TDD) linting mandate in `AGENTS.md`.

## Active Tools

Based on the accepted Architecture Decision Records (`docs/architecture/004-coding-style-and-linting.md`), this project uses:

- **Ruff** for Python analysis and fast, PEP8-compliant code formatting (Backend).
- **ESLint** for static code analysis (Frontend).
- **Prettier** for opinionated code formatting (Frontend).

## Execution Requirements

Before running any tests, committing code, or completing an execution task, you MUST execute the following CLI commands to ensure the codebase complies with the configured standards.

### 1. Format the Frontend Codebase

Always run the formatter first to resolve syntactic and styling inconsistencies across all JavaScript, JSON, and Markdown files.

```bash
npx prettier --write .
```

### 2. Lint the Frontend (and auto-fix)

Run the Javascript linter to catch logical errors and automatically fix any safe violations.

```bash
npx eslint . --fix
```

### 3. Lint and Format the Python Backend (and auto-fix)

Run Ruff to enforce PEP8 standards, catch logical errors, and automatically fix any safe violations in the Python codebase.

```bash
ruff check . --fix
ruff format .
```

## Agent Resolution Mandate

If the `eslint` or `ruff check` commands return a non-zero exit code (indicating unresolved linting errors or warnings configured as errors), the agent **MUST NOT** proceed to testing or committing.

The agent MUST:

1. Review the specific CLI output of the linting errors.
2. Formulate a plan to fix the code logic causing the violations.
3. Apply the fixes.
4. Rerun `npx eslint .` or `ruff check .` to verify all errors are resolved.

Only when Ruff, Prettier, and ESLint all exit cleanly (code 0) is the codebase considered valid for testing or PR submission.

## Step 6: Generate Architecture Decision Records (ADRs)

Use the @.agents/rules/adr-formatting.md rule to write ADRs to the @docs/architecture-decisions/ directory.

Be sure to include separate ADRs specifically for the choice of: 1) test runners, UI testing frameworks, Integration testing frameworks, Performance testing frameworks, and Test Reporting frameworks; 2) Inline code documentation and Developer documentation generation frameworks; and 3) Coding style standards and linting/formatting tools.

## Step 7: Update Documentation

Update the ## Run tests section in the `README.md` in the project's root directory with instructions on how to execute each respective test suites, including which directories to run them from, where to find their raw results and how to get an overview of all test results in a tool like Allure.