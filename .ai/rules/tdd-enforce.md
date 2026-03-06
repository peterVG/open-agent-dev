# TDD Enforcement Rule

**Rule ID:** TDD-ENFORCE  
**Priority:** CRITICAL  
**Applies To:** All implementation tasks

---

## Rule Statement

Before writing ANY implementation code, the agent MUST:

1. **Create test files first** (unit tests or functional tests)
2. **Write failing tests** that define expected behavior
3. **Run tests** to verify they fail (proving they test something)
4. **Implement code** to make tests pass
5. **Verify success** by showing passing tests in Walkthrough artifact

---

## Test-First Workflow

### Step 1: Read Requirements
```
AGENT: [Reads SRS requirement or Gherkin scenario]
AGENT: [Identifies what needs to be tested]
```

### Step 2: Create Test File FIRST
```
AGENT: [Creates tests/unit/test_feature.py]
AGENT: [Writes failing test cases]
AGENT: [Does NOT create implementation file yet]
```

### Step 3: Run Failing Tests
```
AGENT: [Runs: pytest tests/unit/test_feature.py]
AGENT: [Verifies tests fail with expected error]
AGENT: [Documents failure in task notes]
```

### Step 4: Implement Code
```
AGENT: [NOW creates src/feature.py]
AGENT: [Writes minimal code to pass tests]
```

### Step 5: Verify Success
```
AGENT: [Runs: pytest tests/unit/test_feature.py]
AGENT: [All tests pass]
AGENT: [Creates Walkthrough artifact showing test execution]
```

---

## Enforcement

### ❌ VIOLATION: Implementation Before Tests

```python
# BAD: Agent creates src/upload.py first
def upload_file(file_path):
    # Implementation code...
    pass

# Then creates tests/test_upload.py later
def test_upload_file():
    assert upload_file("test.txt") == True
```

**Action:** STOP. Delete implementation. Create tests first.

### ✅ CORRECT: Tests Before Implementation

```python
# GOOD: Agent creates tests/test_upload.py FIRST
def test_upload_file_success():
    """Test that upload_file returns True for valid file."""
    result = upload_file("test.txt")
    assert result == True

def test_upload_file_invalid():
    """Test that upload_file raises error for invalid file."""
    with pytest.raises(FileNotFoundError):
        upload_file("nonexistent.txt")

# Run tests - they FAIL (upload_file doesn't exist yet)
# THEN create src/upload.py to make tests pass
```

---

## Test Types Required

### Unit Tests
**Location:** `tests/unit/`  
**Purpose:** Test individual functions/classes in isolation  
**Required For:** All business logic, utilities, data transformations

**Example:**
```python
# tests/unit/test_chunking.py
def test_calculate_chunks():
    """SRS-UPLOAD-001: Verify chunking calculation."""
    assert calculate_chunks(450, 100) == 5
    assert calculate_chunks(100, 100) == 1
    assert calculate_chunks(501, 100) == 6
```

### Functional Tests (Gherkin/BDD)
**Location:** `tests/features/`  
**Purpose:** Test end-to-end user scenarios  
**Required For:** All user-facing features

**Example:**
```gherkin
# tests/features/upload.feature
# SRS-UPLOAD-001: File upload with chunking
Feature: File Upload
  Scenario: Upload large file
    Given I have a 450MB file
    When I upload the file
    Then the file should be chunked into 5 parts
    And the upload should succeed
```

### Integration Tests
**Location:** `tests/integration/`  
**Purpose:** Test component interactions  
**Required For:** API endpoints, database operations, external services

**Example:**
```python
# tests/integration/test_upload_api.py
def test_upload_endpoint():
    """Test /api/upload endpoint with real file."""
    response = client.post("/api/upload", files={"file": test_file})
    assert response.status_code == 200
    assert "transaction_id" in response.json()
```

### UI Tests
**Location:** `tests/ui/` (or matching framework location)
**Purpose:** Test frontend rendering and interactions
**Required For:** All frontend feature branches, matching the UI Test Mandate in AGENTS.md

**Example:**
```typescript
# tests/ui/upload.spec.ts
import { test, expect } from '@playwright/test';

test('upload button is visible and clickable', async ({ page }) => {
  await page.goto('/upload');
  const button = page.locator('#upload-btn');
  await expect(button).toBeVisible();
});
```

### Performance Tests
**Location:** `tests/performance/` (or matching framework location)
**Purpose:** Simulate expected user concurrency and data volume
**Required For:** Any application intended for production deployment, matching the Performance Test Mandate in AGENTS.md

**Example:**
```python
# tests/performance/locustfile.py
from locust import HttpUser, task, between

class UploadUser(HttpUser):
    wait_time = between(1, 5)

    @task
    def upload_file(self):
        self.client.get("/api/health")
```

---

## Walkthrough Artifact Requirements

When implementation is complete, the Walkthrough artifact MUST include:

### 1. Test Execution Output
```
✅ tests/unit/test_upload.py::test_upload_file_success PASSED
✅ tests/unit/test_upload.py::test_upload_file_invalid PASSED
✅ tests/features/upload.feature::Upload large file PASSED

3 passed in 0.45s
```

### 2. Coverage Report
```
Name                Stmts   Miss  Cover
---------------------------------------
src/upload.py          25      0   100%
---------------------------------------
TOTAL                  25      0   100%
```

### 3. SRS Traceability
```
SRS-UPLOAD-001: File upload with chunking
  ✅ test_calculate_chunks (unit)
  ✅ test_upload_file_success (unit)
  ✅ Upload large file (BDD)
```

---

## Exceptions

This rule does NOT apply to:

1. **Exploratory prototyping** - Explicitly marked as "spike" or "prototype"
2. **Documentation updates** - README, comments, etc.
3. **Configuration changes** - YAML, JSON config files
4. **Refactoring existing tested code** - If tests already exist and pass

For these cases, agent must explicitly state: "TDD-ENFORCE: Not applicable - [reason]"

---

## Integration with Antigravity Workflow

### Gherkin-First Development
```
1. Write Gherkin scenario (tests/features/upload.feature)
2. Write step definitions (tests/features/steps/upload_steps.py)
3. Run BDD tests - they FAIL
4. Write implementation (src/upload.py)
5. Run BDD tests - they PASS
6. Create Walkthrough artifact
```

### SRS Requirement → Test → Code
```
SRS-UPLOAD-001: Support 500MB files with chunking

1. Create tests/unit/test_chunking.py (FIRST)
2. Run pytest - tests FAIL
3. Create src/chunking.py
4. Run pytest - tests PASS
5. Verify in Walkthrough artifact
```

---

## Verification Checklist

Before marking any implementation task as complete, verify:

- [ ] Test files created BEFORE implementation files
- [ ] Tests initially failed (proving they test something)
- [ ] Implementation code makes tests pass
- [ ] All tests pass (unit, integration, UI, performance, BDD)
- [ ] Coverage meets minimum threshold (80%+)
- [ ] Walkthrough artifact shows test execution
- [ ] SRS requirements traced to tests

---

## Enforcement Actions

### If Agent Violates This Rule:

1. **STOP implementation immediately**
2. **Delete implementation code**
3. **Create tests first**
4. **Follow TDD workflow**
5. **Document in task notes**

### If User Requests Violation:

```
USER: Just write the code, skip the tests for now.

AGENT: "I understand the urgency, but TDD-ENFORCE rule requires tests first. 
This ensures:
- Code meets SRS requirements
- No regressions in future changes
- Proof of correctness in Walkthrough

I can write tests very quickly. Shall I proceed with TDD workflow?"
```

Agent should politely push back and explain benefits.

---

## Benefits of TDD Enforcement

1. **Prevents requirement drift** - Tests define expected behavior upfront
2. **Catches bugs early** - Before implementation, not after deployment
3. **Living documentation** - Tests show how code should be used
4. **Refactoring confidence** - Tests ensure changes don't break functionality
5. **SRS traceability** - Every requirement has corresponding tests
6. **Proof of work** - Walkthrough shows tests passing

---

## Example: Complete TDD Cycle

**SRS Requirement:**
```
SRS-UPLOAD-001: System SHALL support file uploads up to 500MB with 100MB chunks.
```

**Step 1: Create Test (FIRST)**
```python
# tests/unit/test_chunking.py
import pytest
from src.chunking import calculate_chunks, ChunkingError

def test_calculate_chunks_normal():
    """SRS-UPLOAD-001: Normal chunking calculation."""
    assert calculate_chunks(450, 100) == 5

def test_calculate_chunks_exceeds_limit():
    """SRS-UPLOAD-001: Reject files over 500MB."""
    with pytest.raises(ChunkingError):
        calculate_chunks(501, 100)
```

**Step 2: Run Test (FAILS)**
```bash
$ pytest tests/unit/test_chunking.py
E   ModuleNotFoundError: No module named 'src.chunking'
FAILED
```

**Step 3: Implement Code**
```python
# src/chunking.py
import math

class ChunkingError(Exception):
    pass

def calculate_chunks(file_size_mb, chunk_size_mb, max_size=500):
    """Calculate number of chunks needed."""
    if file_size_mb > max_size:
        raise ChunkingError(f"File size {file_size_mb}MB exceeds limit {max_size}MB")
    return math.ceil(file_size_mb / chunk_size_mb)
```

**Step 4: Run Test (PASSES)**
```bash
$ pytest tests/unit/test_chunking.py
tests/unit/test_chunking.py::test_calculate_chunks_normal PASSED
tests/unit/test_chunking.py::test_calculate_chunks_exceeds_limit PASSED
2 passed in 0.12s
```

**Step 5: Walkthrough Artifact**
```markdown
# Walkthrough: File Chunking Implementation

## SRS Requirement
SRS-UPLOAD-001: Support file uploads up to 500MB with 100MB chunks

## Test Results
✅ test_calculate_chunks_normal PASSED
✅ test_calculate_chunks_exceeds_limit PASSED

## Coverage
src/chunking.py: 100%

## Verification
All tests pass. Implementation meets SRS-UPLOAD-001.
```

---

**This rule is ALWAYS ACTIVE and CANNOT be disabled without explicit user approval.**
