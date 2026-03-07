# Implementation Plan: Memory Garden

This document outlines the step-by-step implementation plan for the Memory Garden application, based on the requirements defined in the PRD, SRS, and Gherkin feature files.

## Phase 1: Foundation and Infrastructure

- [ ] **Task 1.1: Project Setup & Package Management**
  *   **Description:** Initialize the Node.js project, install the dependencies defined in `package.json`, and configure ESLint, Prettier, and Jest (as per ADR `001` and `003`). Set up the basic Express.js server structure.
  *   **Estimated Time:** 2 hours
  *   **Dependencies:** None
  *   **Related Requirements:** [NFR-002](../prd.md), [TC-001](../prd.md)
  *   **Related Tests:** N/A
  *   **Agent Prompt:** `@AGENTS.md Begin development for Task 1.1 in @docs/plan.md. Generate docs/tasks/Task-1.1-Plan.md and docs/tasks/Task-1.1-ToDos.md to capture the design and checklist. Propose code in /src and config files at the root to complement the setup. Once the task is confirmed complete, check off the \`- [ ]\` markdown box locally inside \`docs/plan.md\`.`

- [ ] **Task 1.2: PostgreSQL Database Schema Setup**
  *   **Description:** Write an automated initialization script to auto-generate the PostgreSQL schema using `pg` to store local metadata and application state.
  *   **Estimated Time:** 3 hours
  *   **Dependencies:** Task 1.1
  *   **Related Requirements:** [SRS-INFRA-001](./srs.md#srs-infra-001-backend-storage-and-architecture)
  *   **Related Tests:** `tests/features/database_initialization_SRS-INFRA-001.feature`
  *   **Agent Prompt:** `@AGENTS.md Begin development for Task 1.2 in @docs/plan.md. Generate docs/tasks/Task-1.2-Plan.md and docs/tasks/Task-1.2-ToDos.md to capture the design and checklist. Propose code in /src/db and unit/integration tests using Jest in /tests/integration/ to complement each logical code block. Output test results using Allure and copy raw CLI output to docs/tasks/Task-1.2-Walkthrough.md. Once the task is confirmed complete, check off the \`- [ ]\` markdown box locally inside \`docs/plan.md\`.`

- [ ] **Task 1.3: Secure Local Authentication (Talon.js)**
  *   **Description:** Implement client-side authentication using Talon.js and set up validation middleware on the Express.js backend for REST and WebSocket connections.
  *   **Estimated Time:** 4 hours
  *   **Dependencies:** Task 1.2
  *   **Related Requirements:** [SRS-SEC-001](./srs.md#srs-sec-001-security-and-authentication)
  *   **Related Tests:** `tests/features/secure_authentication_SRS-SEC-001.feature`
  *   **Agent Prompt:** `@AGENTS.md Begin development for Task 1.3 in @docs/plan.md. Generate docs/tasks/Task-1.3-Plan.md and docs/tasks/Task-1.3-ToDos.md to capture the design and checklist. Propose code in /src/auth and unit/integration tests using Jest in /tests/ to complement each logical code block. Output test results using Allure and copy raw CLI output to docs/tasks/Task-1.3-Walkthrough.md. Once the task is confirmed complete, check off the \`- [ ]\` markdown box locally inside \`docs/plan.md\`.`

## Phase 2: Core Backend Logic and Data APIs

- [ ] **Task 2.1: Open Data API Integration (Express Proxy)**
  *   **Description:** Implement the Express.js proxy routes to fetch metadata from the Internet Archive API, handling caching in Postgres and rate limits.
  *   **Estimated Time:** 5 hours
  *   **Dependencies:** Task 1.2, Task 1.3
  *   **Related Requirements:** [SRS-DATA-001.1](./srs.md#srs-data-0011-open-data-api-integration)
  *   **Related Tests:** `tests/features/open_data_api_integration_SRS-DATA-001.feature`
  *   **Agent Prompt:** `@AGENTS.md Begin development for Task 2.1 in @docs/plan.md. Generate docs/tasks/Task-2.1-Plan.md and docs/tasks/Task-2.1-ToDos.md to capture the design and checklist. Propose code in /src/api and integration tests using Jest in /tests/integration/ to complement each logical code block. Output test results using Allure and copy raw CLI output to docs/tasks/Task-2.1-Walkthrough.md. Once the task is confirmed complete, check off the \`- [ ]\` markdown box locally inside \`docs/plan.md\`.`

- [ ] **Task 2.2: Real-time Data Streaming via Geckos.io**
  *   **Description:** Integrate Geckos.io into the Express server and implement the UDP/WebRTC data channels to push new celestial node discoveries to the client.
  *   **Estimated Time:** 4 hours
  *   **Dependencies:** Task 2.1
  *   **Related Requirements:** [SRS-DATA-001.2](./srs.md#srs-data-0012-real-time-data-streaming)
  *   **Related Tests:** `tests/features/websocket_streaming_SRS-DATA-001.feature`
  *   **Agent Prompt:** `@AGENTS.md Begin development for Task 2.2 in @docs/plan.md. Generate docs/tasks/Task-2.2-Plan.md and docs/tasks/Task-2.2-ToDos.md to capture the design and checklist. Propose code in /src/sockets and integration tests using Jest in /tests/integration/ to complement each logical code block. Output test results using Allure and copy raw CLI output to docs/tasks/Task-2.2-Walkthrough.md. Once the task is confirmed complete, check off the \`- [ ]\` markdown box locally inside \`docs/plan.md\`.`

## Phase 3: Frontend Visualization and UI

- [ ] **Task 3.1: Infinite Canvas WebGL/Canvas Panning**
  *   **Description:** Implement the HTML5 canvas client application. Setup the rendering loop and camera translation logic for continuous panning without hard boundaries, rendering celestial nodes dynamically.
  *   **Estimated Time:** 6 hours
  *   **Dependencies:** Task 2.2
  *   **Related Requirements:** [SRS-NAV-001](./srs.md#srs-nav-001-infinite-canvas-galaxy-navigation)
  *   **Related Tests:** `tests/features/infinite_canvas_navigation_SRS-NAV-001.feature`
  *   **Agent Prompt:** `@AGENTS.md Begin development for Task 3.1 in @docs/plan.md. Generate docs/tasks/Task-3.1-Plan.md and docs/tasks/Task-3.1-ToDos.md to capture the design and checklist. Propose code in /src/client and UI tests using Playwright in /tests/ui/ to complement each logical code block. Output test results using Allure and copy raw CLI output to docs/tasks/Task-3.1-Walkthrough.md. Once the task is confirmed complete, check off the \`- [ ]\` markdown box locally inside \`docs/plan.md\`.`

- [ ] **Task 3.2: Dragon Avatar Control (Powerline Interface)**
  *   **Description:** Implement the dragon avatar kinematics, steering mechanics, and continuous trail rendering algorithm on the canvas frontend.
  *   **Estimated Time:** 6 hours
  *   **Dependencies:** Task 3.1
  *   **Related Requirements:** [SRS-CTRL-001](./srs.md#srs-ctrl-001-dragon-avatar-control-powerline-interface)
  *   **Related Tests:** `tests/features/dragon_avatar_control_SRS-CTRL-001.feature`
  *   **Agent Prompt:** `@AGENTS.md Begin development for Task 3.2 in @docs/plan.md. Generate docs/tasks/Task-3.2-Plan.md and docs/tasks/Task-3.2-ToDos.md to capture the design and checklist. Propose code in /src/client/avatar and UI tests using Playwright in /tests/ui/ to complement each logical code block. Output test results using Allure and copy raw CLI output to docs/tasks/Task-3.2-Walkthrough.md. Once the task is confirmed complete, check off the \`- [ ]\` markdown box locally inside \`docs/plan.md\`.`

## Phase 4: Verification and Finalization

- [ ] **Task 4.1: Performance Testing**
  *   **Description:** Write and run load/performance tests using Artillery to verify that the Express server and Geckos websockets can handle concurrent usage according to PRD objectives.
  *   **Estimated Time:** 3 hours
  *   **Dependencies:** Task 3.2
  *   **Related Requirements:** [NFR-004](../prd.md)
  *   **Related Tests:** N/A
  *   **Agent Prompt:** `@AGENTS.md Begin development for Task 4.1 in @docs/plan.md. Generate docs/tasks/Task-4.1-Plan.md and docs/tasks/Task-4.1-ToDos.md to capture the design and checklist. Propose Artillery configuration in /tests/performance/ and execute the performance tests. Copy raw CLI output to docs/tasks/Task-4.1-Walkthrough.md. Once the task is confirmed complete, check off the \`- [ ]\` markdown box locally inside \`docs/plan.md\`.`

- [ ] **Task 4.2: Documentation, Dockerization & Handoff**
  *   **Description:** Generate the Dockerfile and update README.md with setup instructions.
  *   **Estimated Time:** 2 hours
  *   **Dependencies:** Task 4.1
  *   **Related Requirements:** [NFR-002](../prd.md)
  *   **Related Tests:** N/A
  *   **Agent Prompt:** `@AGENTS.md Read the project's Architecture Decision Records (ADRs) and the finalized tech stack to create an appropriate Dockerfile. Then auto-populate the 'Setup Development Environment' (including 'Test Execution & Reporting' instructions), 'Viewing Developer Documentation', 'Setup Production Environment', and 'How to Dockerize' sections of the README.md file. Ensure installation instructions are platform-agnostic (don't assume macOS/Homebrew) or explicitly accommodate multiple operating systems as required by the ADRs. Make sure to check off the task as complete in docs/plan.md once finished.`

- [ ] **Task 4.3: Architecture Synthesis**
  *   **Description:** Synthesize documentation and generate the architecture reference diagram.
  *   **Estimated Time:** 1 hour
  *   **Dependencies:** Task 4.2
  *   **Related Requirements:** N/A
  *   **Related Tests:** N/A
  *   **Agent Prompt:** `@AGENTS.md Invoke the @architecture-writer skill. Read its instructions entirely, then execute all steps to synthesize the PRD, SRS, codebase reality, and ADRs into a comprehensive docs/architecture.md file featuring ISO 42010 viewpoints and Mermaid diagrams. Make sure to check off the task as complete in docs/plan.md once finished.`

## Summary Timeline
*   **Total Estimated Time:** 36 hours
*   **Critical Path:** Database Setup -> Auth & Proxy API -> Websockets -> Canvas Rendering -> Dragon Kinematics -> Verification -> Documentation
