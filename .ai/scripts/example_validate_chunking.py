#!/usr/bin/env python3
"""
Example validation script: Validates file chunking logic.

This script demonstrates how to create executable validation
that the AI agent can run via code_interpreter.

Usage:
    python example_validate_chunking.py --file-size 450 --chunk-size 100

SRS Requirements:
    - SRS-UPLOAD-001: Maximum file size is 500MB
    - SRS-UPLOAD-002: Chunk size must be between 1MB and 12MB
    - SRS-PERF-001: Files under 10MB should not be chunked
"""

import argparse
import math


def calculate_chunks(file_size_mb, chunk_size_mb):
    """Calculate number of chunks needed."""
    return math.ceil(file_size_mb / chunk_size_mb)

def validate_chunking(file_size_mb, chunk_size_mb, max_file_size=500, max_chunk_size=12):
    """
    Validate chunking logic against SRS requirements.
    
    Returns:
        dict: Validation results with status and any errors
    """
    results = {
        "file_size_mb": file_size_mb,
        "chunk_size_mb": chunk_size_mb,
        "num_chunks": calculate_chunks(file_size_mb, chunk_size_mb),
        "valid": True,
        "errors": [],
        "warnings": []
    }

    # SRS-UPLOAD-001: Maximum file size is 500MB
    if file_size_mb > max_file_size:
        results["valid"] = False
        results["errors"].append(
            f"SRS-UPLOAD-001 VIOLATION: File size {file_size_mb}MB exceeds maximum {max_file_size}MB"
        )

    # SRS-UPLOAD-002: Chunk size must be between 1MB and 12MB
    if chunk_size_mb < 1:
        results["valid"] = False
        results["errors"].append(
            f"SRS-UPLOAD-002 VIOLATION: Chunk size {chunk_size_mb}MB is below minimum 1MB"
        )

    if chunk_size_mb > max_chunk_size:
        results["valid"] = False
        results["errors"].append(
            f"SRS-UPLOAD-002 VIOLATION: Chunk size {chunk_size_mb}MB exceeds maximum {max_chunk_size}MB"
        )

    # SRS-PERF-001: Files under 10MB should not be chunked
    if file_size_mb < 10 and results["num_chunks"] > 1:
        results["warnings"].append(
            f"SRS-PERF-001 WARNING: File {file_size_mb}MB should not be chunked (< 10MB threshold)"
        )

    # Additional validation: Optimal chunk size
    if file_size_mb >= 10 and chunk_size_mb < 10:
        results["warnings"].append(
            f"OPTIMIZATION: Chunk size {chunk_size_mb}MB is small. Consider 10MB chunks for better performance."
        )

    return results

def print_results(results):
    """Pretty print validation results."""
    print("=" * 60)
    print("CHUNKING VALIDATION RESULTS")
    print("=" * 60)
    print(f"File Size:       {results['file_size_mb']}MB")
    print(f"Chunk Size:      {results['chunk_size_mb']}MB")
    print(f"Number of Chunks: {results['num_chunks']}")
    print(f"Status:          {'✅ VALID' if results['valid'] else '❌ INVALID'}")
    print("=" * 60)

    if results["errors"]:
        print("\n❌ ERRORS:")
        for error in results["errors"]:
            print(f"  - {error}")

    if results["warnings"]:
        print("\n⚠️  WARNINGS:")
        for warning in results["warnings"]:
            print(f"  - {warning}")

    if results["valid"] and not results["warnings"]:
        print("\n✅ All checks passed! Chunking logic is valid.")

    print("=" * 60)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Validate file chunking logic against SRS requirements"
    )
    parser.add_argument(
        "--file-size",
        type=float,
        required=True,
        help="File size in MB"
    )
    parser.add_argument(
        "--chunk-size",
        type=float,
        default=10,
        help="Chunk size in MB (default: 10)"
    )

    args = parser.parse_args()

    results = validate_chunking(args.file_size, args.chunk_size)
    print_results(results)

    # Exit with appropriate code
    exit(0 if results["valid"] else 1)
