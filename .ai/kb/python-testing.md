# Python Testing Framework and Tools

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
