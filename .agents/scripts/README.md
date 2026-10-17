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
- `validate_rate_limits.py` - Verify API rate-limit logic
- `audit_dependencies.py` - Check for "high gravity" dependencies
- `generate_coverage_report.py` - Test coverage analysis

## Example Structure

```
scripts/
├── validation/
│   ├── validate_chunking_logic.py
│   └── calculate_storage_fees.py
├── simulation/
│   ├── simulate_concurrent_uploads.py
│   └── generate_test_data.py
└── analysis/
    └── validate_rate_limits.py
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

## Example: API Rate-Limit Validation

**`.agents/scripts/analysis/validate_rate_limits.py`:**

```python
#!/usr/bin/env python3
"""
Validates a fixed-window API rate-limit policy against SRS requirements.

Simulates a burst of requests from one client and checks that requests
beyond the limit are rejected and the window resets as specified.

Usage:
    python validate_rate_limits.py --limit 100 --window 60 --requests 150
"""

import argparse


def simulate_window(limit, requests):
    """Return (accepted, rejected) counts for one window of requests."""
    accepted = min(requests, limit)
    return accepted, requests - accepted


def validate_rate_limits(limit, window_s, requests):
    """Validate rate-limit behaviour against requirements."""
    accepted, rejected = simulate_window(limit, requests)
    errors = []

    # SRS-API-010: A client MUST NOT exceed `limit` requests per window
    if accepted > limit:
        errors.append(f"Accepted {accepted} requests, limit is {limit}")

    # SRS-API-011: Requests beyond the limit MUST be rejected (HTTP 429)
    if requests > limit and rejected != requests - limit:
        errors.append(f"Expected {requests - limit} rejections, got {rejected}")

    # SRS-API-012: The window MUST be between 1 and 3600 seconds
    if not 1 <= window_s <= 3600:
        errors.append(f"Window {window_s}s is outside 1-3600s")

    return {"accepted": accepted, "rejected": rejected, "errors": errors}


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Validate rate-limit logic")
    parser.add_argument("--limit", type=int, required=True)
    parser.add_argument("--window", type=int, default=60)
    parser.add_argument("--requests", type=int, required=True)
    args = parser.parse_args()

    results = validate_rate_limits(args.limit, args.window, args.requests)
    print(results)
    exit(1 if results["errors"] else 0)
```

**Agent uses this to:**
1. Validate rate-limit logic before deployment
2. Check edge cases (exactly at the limit, one over, invalid window)
3. Verify compliance with the SRS requirements it cites

## Integration with the Agent Workflow

```
1. Write SRS requirement: "A client MUST NOT exceed 100 requests per 60-second window"
2. Create validation script: .agents/scripts/analysis/validate_rate_limits.py
3. Agent executes script during architecture validation
4. Script verifies logic meets SRS-API-010
5. Agent reports compliance status
```

Scripts become **executable documentation** that proves your system meets requirements!
