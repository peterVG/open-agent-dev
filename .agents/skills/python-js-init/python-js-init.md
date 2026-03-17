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

### 6. Code Formatting and Linting: `ruff`
- **Purpose**: Ensures code quality and standard style before testing.
- **Configuration**: Defined in `pyproject.toml` targeting Python 3.11 features.

## Directory Structure

The `tests/` directory is logically partitioned based on testing scope:
- `tests/unit/`: Focused, isolated tests for individual functions and classes.
- `tests/integration/`: Tests verifying interactions between multiple components or modules.
- `tests/ui/`: Tests dedicated to user interface workflows.
- `tests/features/`: BDD feature files and step definitions (`behave`).
- `tests/performance/`: Load testing scripts (`locust`).
- `tests/allure-results/`: Directory capturing real-time test output for Allure reporting.

## Best Practices
- Run code formatting and linting via `ruff` prior to running tests.
- Execute unit and integration tests via `pytest`.
- Execute performance limits via `locust`.
- Execute behavior feature maps via `behave`.
- After a test run, compile `allure` results using the Allure CLI to generate viewable test coverage HTML reports.


## Step 3: Update Documentation

Update the `README.md` to document the exact commands needed to start both the Python backend and the Javascript frontend using Docker Compose, and how to execute their respective test suites from within their workspace directories.
