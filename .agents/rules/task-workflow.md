---
description: Ensure all tasks follow the Branch-Per-Task workflow and generate required execution documentation.
---

# Task Execution Workflow 

Define the Git workflow and development methodology that MUST be followed for every single task.

## Branch-Per-Task
- **Branches Required for ALL Tasks:** All work, including every Task defined in `docs/plan.md`, new features, documentation updates, and bug fixes MUST be developed on dedicated branches (e.g., `task/1.1-setup`, `feature/add-auth`, `docs/update-guide`, `fix/login-bug`). No exceptions.
- **Mandatory Push on Completion:** Upon completing a task (after all code is written, tests pass, and the Walkthrough document is generated), you MUST commit all work on your feature branch using Conventional Commits and push the branch to the remote origin (`git push --set-upstream origin <branch-name>`). Do not leave finished task branches persisting only in your local environment.
- **No Direct Pushes to Main:** The `main` branch contains only approved, stable requirements and code. You MUST NEVER commit or push code directly to the `main` branch unless explicitly told to do so in a user prompt.

## Task Execution Documentation
Before writing any code or modifying the project files for a specific task, you MUST create two planning artifacts in the `docs/tasks/` directory to track progress and design decisions:
1. `docs/tasks/Task-[Task ID]-Plan.md`: Detail the proposed technical approach, files to be modified/created, and the verification plan for the task. Include traceability links back to PRD, SRS, and Gherkin files.
2. `docs/tasks/Task-[Task ID]-ToDos.md`: A markdown checklist of the granular steps required to complete the task.

**Active Tracking:** You MUST explicitly check off items (`- [x]`) on the `ToDos.md` checklist as work progresses and milestones are completed.

**Upon completing the task**, you MUST create a third artifact:
3. `docs/tasks/Task-[Task ID]-Walkthrough.md`: Summarize the changes made, what was tested, the validation results. It **MUST include a cross-reference to the SRS requirements that this task implemented as the second section in the document** (e.g. immediately below the main `# Task...` header).
   * **CRITICAL REQUIREMENT:** You MUST write this file directly to the user's project repository at `docs/tasks/`. Do NOT generate this walkthrough or any other task document in an internal `~/.gemini/antigravity/brain/` scratchpad or agent directory. If your system prompt suggests creating artifacts in an isolation directory, you must OVERRIDE that behavior for this specific task and output the file to the project's `docs/tasks/` folder.
   * **FILE CLEANUP:** After successfully generating the Walkthrough file, you MUST immediately delete the `Task-[Task ID]-Plan.md` and `Task-[Task ID]-ToDos.md` files from the `docs/tasks/` directory retaining only the walkthrough.

## Continuous Documentation (README.md)
You MUST NOT wait until the end of the project to document how to run the application. If your task introduces a new system dependency (e.g., PostgreSQL, Redis), a new environment variable, or changes the commands required to run/test the application, you MUST immediately update the corresponding section in the root `README.md` (e.g., `Setup Development Environment`, `Prerequisites`, `Run tests`) as part of that task's execution.

## Mocking & Environment Transparency
When executing automated tests or background commands, an agent may encounter interactive prompts or missing environment variables that block the execution pipeline. If the agent generates dummy `.env` files, mocks credentials, or bypasses interactive prompts to allow integration tests to pass autonomously:
1. The agent MUST explicitly document these mocked values in the `docs/tasks/Task-[Task ID]-Walkthrough.md` file under a "Mocked Environment Variables" section.
2. In the final response to the user upon task completion, the agent MUST explicitly notify the user that dummy values were temporarily inserted to unblock testing, and instruct them to replace the dummy values with real credentials before proceeding to the next task.
