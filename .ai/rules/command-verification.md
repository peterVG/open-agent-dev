---
description: Ensure all terminal commands, build steps, and execution scripts documented for humans are actually functional.
---

# Strict Command Verification

Guarantee that any CLI commands, build steps, or execution scripts documented for humans are actually functional and tested against current dependencies.

1. **Test Before Documenting:** Before validating or documenting ANY terminal command, build step, or execution script in a `README.md` or `walkthrough.md`, you MUST first execute that exact command locally using your CLI execution tools to verify it succeeds without errors against the currently installed dependency versions.
2. **Handle Failures:** If the local verification command fails, you MUST NOT document the broken command. Instead, you must either troubleshoot and correct the command syntax, or modify the project configurations/dependencies until the command executes successfully.
