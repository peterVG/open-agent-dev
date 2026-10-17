# Scripts Directory

This directory contains **task-specific helper scripts** that the AI agent can run using the agent's shell or code-execution tool to validate logic, simulate load, or perform automated checks.

> **Note:** The repository's actual verification gates (pre-commit checks for branches, formatting, docs, links, logging, ports, tests, and workspace boundaries) live in the top-level [`scripts/`](../../scripts/) directory. This folder is for ad hoc, task-specific helpers. The script names and code below are illustrative examples, not files shipped with the template.

## Purpose

Scripts enable the agent to:
- ✅ **Validate** business logic without deploying code
- ✅ **Simulate** load testing or edge cases
- ✅ **Verify** calculations (e.g., fee estimation, chunking logic)
- ✅ **Automate** repetitive verification tasks

## What Goes Here

### Validation Scripts
Scripts that verify business logic or calculations:
- `validate_chunking_logic.py` - Verify file chunking algorithm
- `calculate_storage_fees.py` - Estimate object-storage costs for expected data volume
- `verify_encryption.py` - Test encryption/decryption logic

### Simulation Scripts
Scripts that simulate system behavior:
- `simulate_concurrent_uploads.py` - Test load handling
- `simulate_network_failure.py` - Test retry logic
- `generate_test_data.py` - Create test datasets

### Analysis Scripts
Scripts that analyze or report on data:
- `expected_rate_limits.py` - Calculate expected API rate-limit behaviour from SRS parameters
- `audit_dependencies.py` - Check for "high gravity" dependencies
- `generate_coverage_report.py` - Test coverage analysis

## Example Structure

```
.agents/scripts/
├── validation/
│   ├── validate_chunking_logic.py
│   └── calculate_storage_fees.py
├── simulation/
│   ├── simulate_concurrent_uploads.py
│   └── generate_test_data.py
└── analysis/
    └── expected_rate_limits.py
```

## How Skills Use Scripts

Skills can execute scripts using the agent's shell or code-execution tool:

```yaml
---
name: Architecture Validator
description: Validates system architecture decisions
allowed-tools:
  - code-execution
scripts:
  - .agents/scripts/validation/calculate_storage_fees.py
---

# Architecture Validator Skill

When validating the file upload architecture:
1. Read the architecture.md
2. Execute .agents/scripts/validation/calculate_storage_fees.py
3. Verify that estimated costs align with PRD budget constraints
4. Report any issues
```

## Example Script: Chunking Validation

**`.agents/scripts/validation/validate_chunking_logic.py`:**

```python
#!/usr/bin/env python3
"""
Validates file chunking logic for multipart uploads to cloud object storage.

Usage:
    python validate_chunking_logic.py --file-size 450 --chunk-size 100
"""

import argparse

def calculate_chunks(file_size_mb, chunk_size_mb):
    """Calculate number of chunks needed."""
    import math
    return math.ceil(file_size_mb / chunk_size_mb)

def validate_chunking(file_size_mb, chunk_size_mb, max_file_size=500):
    """Validate chunking logic against requirements."""
    results = {
        "file_size_mb": file_size_mb,
        "chunk_size_mb": chunk_size_mb,
        "num_chunks": calculate_chunks(file_size_mb, chunk_size_mb),
        "valid": True,
        "errors": []
    }
    
    # SRS-UPLOAD-001: Maximum file size is 500MB
    if file_size_mb > max_file_size:
        results["valid"] = False
        results["errors"].append(f"File size {file_size_mb}MB exceeds maximum {max_file_size}MB")
    
    # SRS-UPLOAD-002: Chunk size must be at least 1MB
    if chunk_size_mb < 1:
        results["valid"] = False
        results["errors"].append(f"Chunk size {chunk_size_mb}MB is below minimum 1MB")
    
    # SRS-PERF-001: Files under 10MB should not be chunked
    if file_size_mb < 10 and results["num_chunks"] > 1:
        results["valid"] = False
        results["errors"].append(f"File {file_size_mb}MB should not be chunked (< 10MB)")
    
    return results

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Validate file chunking logic")
    parser.add_argument("--file-size", type=float, required=True, help="File size in MB")
    parser.add_argument("--chunk-size", type=float, default=100, help="Chunk size in MB")
    
    args = parser.parse_args()
    
    results = validate_chunking(args.file_size, args.chunk_size)
    
    print(f"File Size: {results['file_size_mb']}MB")
    print(f"Chunk Size: {results['chunk_size_mb']}MB")
    print(f"Number of Chunks: {results['num_chunks']}")
    print(f"Valid: {results['valid']}")
    
    if not results["valid"]:
        print("\nErrors:")
        for error in results["errors"]:
            print(f"  - {error}")
        exit(1)
    else:
        print("\n✅ Chunking logic is valid!")
        exit(0)
```

## Agent Workflow with Scripts

```
USER: Verify that our chunking logic meets the SRS requirements

AGENT: [Activates Architecture Validator skill]
AGENT: [Skill specifies .agents/scripts/validation/validate_chunking_logic.py]
AGENT: [Executes script with test cases]
AGENT: [Reports results]

OUTPUT:
✅ Test 1: 5MB file → 1 chunk (valid)
✅ Test 2: 450MB file → 5 chunks (valid)
✅ Test 3: 500MB file → 5 chunks (valid)
❌ Test 4: 501MB file → Error: exceeds maximum (valid error handling)
```

## Best Practices

### 1. Make Scripts Executable
```bash
chmod +x .agents/scripts/validation/validate_chunking_logic.py
```

### 2. Include Documentation
Every script should have:
- Docstring explaining purpose
- Usage examples
- SRS requirement references

### 3. Use Standard Libraries
Minimize dependencies to keep scripts portable:
- ✅ Use Python standard library when possible
- ⚠️ If external deps needed, document in `requirements.txt`

### 4. Return Exit Codes
```python
if validation_passed:
    exit(0)  # Success
else:
    exit(1)  # Failure
```

### 5. Map to SRS Requirements
```python
# SRS-UPLOAD-001: Maximum file size is 500MB
if file_size_mb > 500:
    results["errors"].append("Exceeds SRS-UPLOAD-001 limit")
```

## Progressive Disclosure Benefits

Scripts are only loaded and executed when:
- A skill explicitly requires them
- The agent needs to validate logic
- The user requests simulation or analysis

This saves tokens and execution time when scripts aren't needed.

## Example: API Rate-Limit Expected-Value Calculator

**`.agents/scripts/analysis/expected_rate_limits.py`:**

```python
#!/usr/bin/env python3
"""
Calculates the expected behaviour of a fixed-window API rate-limit policy
from the SRS parameters.

Given a limit, a window, and a burst size from one client, it computes how
many requests SHOULD be accepted and how many SHOULD be rejected with
HTTP 429 before the window resets. It does NOT exercise the live limiter:
compare its output with the responses observed in an integration or load
test to confirm the real limiter matches the SRS.

Usage:
    python expected_rate_limits.py --limit 100 --window 60 --requests 150
"""

import argparse
import sys


def find_invalid_inputs(limit, window_s, requests):
    """Return a list of messages describing invalid input parameters."""
    problems = []
    if limit < 1:
        problems.append(f"--limit must be >= 1, got {limit}")
    if window_s < 1:
        problems.append(f"--window must be >= 1, got {window_s}")
    if requests < 0:
        problems.append(f"--requests must be >= 0, got {requests}")
    return problems


def simulate_window(limit, requests):
    """Return the expected (accepted, rejected) counts for one window."""
    accepted = min(requests, limit)
    return accepted, requests - accepted


def expected_rate_limits(limit, window_s, requests):
    """Compute the expected accept/429/reset behaviour from the SRS parameters."""
    accepted, rejected = simulate_window(limit, requests)
    errors = []

    # SRS-API-012: The window MUST be between 1 and 3600 seconds
    if window_s > 3600:
        errors.append(f"Window {window_s}s is outside the SRS range 1-3600s")

    return {
        "expected_accepted": accepted,              # SRS-API-010
        "expected_429_responses": rejected,         # SRS-API-011
        "expected_reset_after_s": window_s,         # SRS-API-012
        "errors": errors,
    }


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Calculate expected rate-limit behaviour from SRS parameters"
    )
    parser.add_argument("--limit", type=int, required=True)
    parser.add_argument("--window", type=int, default=60)
    parser.add_argument("--requests", type=int, required=True)
    args = parser.parse_args()

    invalid = find_invalid_inputs(args.limit, args.window, args.requests)
    if invalid:
        print({"errors": invalid}, file=sys.stderr)
        sys.exit(2)

    results = expected_rate_limits(args.limit, args.window, args.requests)
    print(results)
    sys.exit(1 if results["errors"] else 0)
```

**Agent uses this to:**
1. Derive the expected number of accepted requests, HTTP 429 responses, and the reset time from the SRS parameters
2. Compare those expected values with the responses observed in an integration or load test against the real limiter
3. Check edge cases (exactly at the limit, one over, out-of-range window) before writing the test assertions

This script only calculates expected values; it does not prove the deployed limiter behaves correctly. That proof comes from the integration or load test that asserts the observed responses match these values.

## Integration with the Agent Workflow

```
1. Write SRS requirement: "A client MUST NOT exceed 100 requests per 60-second window"
2. Create calculator script: .agents/scripts/analysis/expected_rate_limits.py
3. Agent executes script to compute the expected accepted/429/reset values for SRS-API-010 to SRS-API-012
4. Integration or load test sends the burst to the real limiter and records the observed responses
5. Agent compares observed with expected values and reports compliance status
```

Scripts become **executable documentation** that proves your system meets requirements!
