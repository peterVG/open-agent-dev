---
name: Implementation Plan Writer
description: Generates an interactive, traceable implementation plan based on PRD, SRS, and Gherkin files
allowed-tools:
  - code_interpreter
---

# Implementation Plan Writer Skill

## Purpose

This skill enables the agent to translate Product Requirements Document (PRD), Software Requirements Specification (SRS), and Gherkin `.feature` files into a cohesive, step-by-step implementation plan.

## When to Use This Skill

- When asked to "Generate an implementation plan" using `@docs/prd.md`, `@docs/srs.md`, and `@tests/features/`
- When breaking down agreed-upon requirements into actionable developer tasks
- When the user references this skill explicitly

## Core Principles

### 1. Interactive Checkboxes

Every task MUST be formatted as an interactive Markdown checkbox so that progress can be tracked directly within the document.

**Format:**

```markdown
- [ ] **Task 1.1: Project Setup & Configuration**
  - **Description:** Initialize the Python virtual environment...
```

### 2. Strict Traceability

Every task MUST explicitly link back to its originating requirements (PRD/SRS) and its associated verification tests (Gherkin feature files).

**Format:**

```markdown
- [ ] **Task 2.5: API Error Handling**
  - **Description:** Implement robust error catching...
  - **Estimated Time:** 1 hour
  - **Dependencies:** Task 2.3
  - **Related Requirements:** [SRS-SEC-001](../srs.md#srs-sec-001-local-sovereignty--transparency), [NFR-002](../prd.md#nfr-002-api-transparency)
  - **Related Tests:** [`local_sovereignty_SRS-SEC-001.feature`](../../tests/features/local_sovereignty_SRS-SEC-001.feature)
  - **Agent Prompt:** `@AGENTS.md Begin development for Task [Task ID] in @docs/plan.md. Generate docs/tasks/Task-[Task ID]-Plan.md and docs/tasks/Task-[Task ID]-ToDos.md to capture the design and checklist. Propose the implementation code and corresponding testing suite in the appropriate directories within the repository, adhering rigorously to the established Architecture Decision Records (ADRs) for the frontend/backend tech stacks.`
```

_If a task is purely structural (e.g., setting up a repository) and has no specific tests, mark Related Tests as `N/A`._

### 4. Development Prompts

Every task MUST include an actionable prompt for the agent to begin development. This prompt MUST NOT hardcode language-specific paths (like `/src` or `/tests`) unless a PRD and SRS explicitly dictate the finalized monorepo/folder architecture. Instead, instruct the agent to propose code and write tests in the "appropriate directories within the repository, adhering rigorously to the established Architecture Decision Records (ADRs)."
For tasks that involve building user interfaces, the prompt MUST explicitly instruct the agent to write UI tests using the UI testing framework specified in the project's Architecture Decision Records (ADRs).
For tasks that involve external dependencies (APIs, databases, filesystems), the prompt MUST explicitly instruct the agent to write Integration tests using the Integration framework specified in the ADRs.
The implementation plan MUST include a dedicated task in the Verification phase to write and execute Performance/Load tests (e.g., Locust) using the framework specified in the ADRs.
Additionally, the Agent Prompt for all testing tasks MUST explicitly instruct the developer to output test results using the Test Reporting framework (e.g., Allure) specified in the ADRs, AND to copy the raw CLI output of the test runs into a permanent `docs/tasks/Task-[Task ID]-Walkthrough.md` file. **Crucially, the prompt MUST mandate that this file is saved directly into the project's `docs/tasks/` folder and NEVER in an internal agent scratchpad.**
Crucially, the prompt MUST also explicitly instruct the agent to check off the `- [ ]` markdown box locally inside `docs/plan.md` the moment the task is confirmed complete.

### 3. Phased, Dependency-Aware Approach

Tasks MUST be logically grouped into Phases (e.g., Phase 1: Foundation, Phase 2: Core Logic). No task should be scheduled before its dependencies are complete. Usually, Database and Data Layer tasks precede UI tasks.

### 5. Holistic UI Planning

When defining the Implementation Plan, the agent MUST NOT silo highly coupled UI mechanics (e.g., Canvas rendering and the Avatar that controls it) into separate sequential tasks. If the interaction model of a later requirement (e.g., Avatar Steering) supersedes or fundamentally alters the interaction model of an earlier requirement (e.g., Canvas Panning), they MUST be combined into a single holistic UI/UX task to prevent building throwaway interaction code. Abide by `.agents/rules/holistic-ui.md`.

## Template Structure

```markdown
# Implementation Plan: [Project Name]

This document outlines the step-by-step implementation plan...

## Phase 1: [Phase Name]

- [ ] **Task 1.1: [Task Name]**
  - **Description:** [Actionable details]
  - **Estimated Time:** [Estimated developer hours]
  - **Dependencies:** [Previous tasks, e.g., Task 1.1 or None]
  - **Related Requirements:** [[SRS/PRD mapping]](../srs.md)
  - **Related Tests:** [[Path to Gherkin file or N/A]](../../tests/features/)
  - **Agent Prompt:** `@AGENTS.md Begin development for Task [Task ID] in @docs/plan.md. Generate docs/tasks/Task-[Task ID]-Plan.md and docs/tasks/Task-[Task ID]-ToDos.md to capture the design and checklist. Propose the implementation code and corresponding testing suite in the appropriate directories within the repository, adhering rigorously to the established Architecture Decision Records (ADRs). Upon completion, YOU MUST generate docs/tasks/Task-[Task ID]-Walkthrough.md directly in the project repository—DO NOT use an internal scratchpad. If this task introduces new dependencies or changes run commands, you MUST update the root README.md Setup instructions.`

## Summary Timeline

- **Total Estimated Time:** [Sum of hours]
- **Critical Path:** [High-level flow, e.g., Database Setup -> API -> UI]
```

## Anti-Patterns to Avoid

### ❌ Don't: Output simple bulleted lists without checkboxes

```markdown
# BAD

- Task 1: Setup database
```

### ❌ Don't: Omit the Traceability Links

```markdown
# BAD

- [ ] **Task 1:** Setup database
  - **Description:** Create schema.
  - **Estimated Time:** 2 hours
```

### ✅ Do: Include full traceability and checkboxes

```markdown
# GOOD

- [ ] **Task 1.2: SQLite Database Schema Setup**
  - **Description:** Write an automated initialization script...
  - **Estimated Time:** 2 hours
  - **Dependencies:** Task 1.1
  - **Related Requirements:** SRS-DATA-001, TC-002
  - **Related Tests:** `tests/features/database_persistence_SRS-DATA-001.feature`
  - **Agent Prompt:** `@AGENTS.md Begin development for Task [Task ID] in @docs/plan.md. Generate docs/tasks/Task-[Task ID]-Plan.md and docs/tasks/Task-[Task ID]-ToDos.md to capture the design and checklist. Propose the implementation code and corresponding testing suite in the appropriate directories within the repository, adhering rigorously to the established Architecture Decision Records (ADRs). Upon completion, YOU MUST generate docs/tasks/Task-[Task ID]-Walkthrough.md directly in the project repository—DO NOT use an internal scratchpad. If this task introduces new dependencies or changes run commands, you MUST update the root README.md Setup instructions.`
```

## Workflow: PRD/SRS/Gherkin → Plan

### Step 1: Read all Context

Scan the provided PRD, SRS, and `tests/features/` directory map.

### Step 2: Group by Phase

Identify foundational requirements (infrastructure, DB) vs core logic vs UI.

### Step 3: Write Tasks with Checkboxes

Draft the plan using the interactive `- [ ]` markdown syntax.

### Step 4: Map Tests and Requirements

Carefully trace each task to its matching SRS block and Gherkin file.

### Step 5: Gather Dependencies

Review the final plan, SRS, and ADRs to identify all necessary third-party libraries and frameworks. Generate or update a fresh dependency file appropriate for the stack (e.g., `requirements.txt` for Python, `package.json` for JS).

### Step 6: Documentation, Dockerization & Handoff

Ensure the final Phase of the implementation plan includes a task for creating a `Dockerfile` appropriate for the finalized tech stack, and auto-populating the main `README.md` sections (Development Environment, Viewing Developer Documentation, Production Environment, How to Dockerize, etc.) based on the finalized tech stack and any Architecture Decision Records (ADRs).
For this final task, you MUST use the following exact Agent Prompt:
`@AGENTS.md Read the project's Architecture Decision Records (ADRs) and the finalized tech stack to create an appropriate Dockerfile. Then auto-populate the 'Setup Development Environment' (including 'Test Execution & Reporting' instructions), 'Viewing Developer Documentation', 'Setup Production Environment', and 'How to Dockerize' sections of the README.md file. Ensure installation instructions are platform-agnostic (don't assume macOS/Homebrew) or explicitly accommodate multiple operating systems as required by the ADRs. Make sure to check off the task as complete in docs/plan.md once finished.`

### Step 7: Architecture Synthesis

Ensure the _absolute final task_ of the implementation plan invokes the Architecture Writer skill to map the completed system.
For this final task, you MUST use the following exact Agent Prompt:
`@AGENTS.md Invoke the @architecture-writer skill. Read its instructions entirely, then execute all steps to synthesize the PRD, SRS, codebase reality, and ADRs into a comprehensive docs/architecture.md file featuring ISO 42010 viewpoints and Mermaid diagrams. Make sure to check off the task as complete in docs/plan.md once finished.`

## Output Format

When asked to generate an implementation plan, the agent should:

1. **Create/Update `docs/plan.md`**
2. **Use Markdown Checkboxes** for every task.
3. **Include `Related Requirements`, `Related Tests`, and `Agent Prompt`** bullet points for every task.
4. **Group by logical technical phases.**
5. **Generate a Dependency File** (e.g., `requirements.txt`, `package.json`, `Cargo.toml`) that reflects all dependencies required by the finalized plan, SRS, and ADRs.
6. **Include a penultimate task** to write a `Dockerfile` and update the repository's `README.md` with environment setup and Dockerization instructions.
7. **Include an ultimate task** that explicitly invokes the `@architecture-writer` skill to generate `docs/architecture.md`.

## Success Criteria

- ✅ File successfully created as `docs/plan.md`
- ✅ Every task is a `- [ ]` checkbox
- ✅ Every task maps to PRD/SRS requirements
- ✅ Every task maps to a Gherkin feature file (or is explicitly marked N/A contextually)
- ✅ Dependencies logically flow from Phase 1 onwards
- ✅ A fresh dependency file (e.g., `requirements.txt`) is generated identifying all required packages.
- ✅ The plan ends with tasks to configure Docker, README.md, and then finally generate the architecture.md file via the `@architecture-writer` skill.
