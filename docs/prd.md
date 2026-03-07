# Project Requirements Document: Memory Garden

# Executive Summary
Memory Garden is an interactive, gamified data visualization tool that allows users to explore open data APIs (such as the Internet Archive) via an infinite canvas. Users control a "Powerline-style" dragon avatar through a digital galaxy where celestial bodies represent data repositories. 

# Product Vision
Memory Garden solves the problem of dry, overwhelming, and uninspiring traditional database searches by providing an aesthetic, relaxing, and serendipitous journey through a gamified cosmos.

## Problem Statement
Traditional database searches and archive portals present information in dense lists and grids, which can be intimidating for users who want to organically discover and explore historical or educational content without a specific query in mind.

## Target Users
Researchers, digital archivists, students, data visualization enthusiasts, and gamers who enjoy ambient/educational exploration.

# Functional Requirements

## F-001: Infinite Canvas Galaxy Navigation
**Priority:** Mandatory
**User Story:** As an explorer, I want to traverse a boundless 2D/3D environment so that I can feel a sense of scale and freedom when discovering information.
### Acceptance Criteria
- User can pan continuously in any direction without encountering a hard boundary.
- The environment dynamically loads celestial visual elements as the user pans.

## F-002: Dragon Avatar Control (Powerline Interface)
**Priority:** Mandatory
**User Story:** As an explorer, I want to control a fluid, continuous avatar (a dragon) using simple mechanics so that navigation is engaging and satisfying.
### Acceptance Criteria
- User can steer the dragon using keyboard arrows or mouse/touch input.
- Dragon leaves a visual trail that does not intersect itself destructively (or has gamified rules around intersection).
- Movement is smooth and continuous (60fps target).

## F-003: Celestial Content Nodes
**Priority:** Mandatory
**User Story:** As an explorer, I want to approach generated stars and planets that contain real data from the Internet Archive so that I can discover content.
### Acceptance Criteria
- Celestial nodes are spawned in the galaxy.
- Nodes visually indicate the type or density of data they contain.
- Colliding with or orbiting a node opens a data viewer UI.

## F-004: Open Data API Integration
**Priority:** Mandatory
**User Story:** As a system process, I need to fetch metadata from the Internet Archive REST API to populate the celestial nodes.
### Acceptance Criteria
- App successfully authenticates (if necessary) or calls public endpoints of the Internet Archive.
- Results are paginated or chunked to avoid rate limits.
- The UI handles loading states gracefully while data is fetched.

# Non-Functional Requirements

## NFR-001: Scale-to-Zero and Local-First Architecture
**Requirement:** The application MUST function effectively to minimize infrastructure costs while still supporting backend capabilities via Express.js and Postgres.
**Rationale:** Adheres to AGENTS.md "Scale-to-Zero" and "Local-First" principles, minimizing infrastructure costs where possible, while accommodating the explicit user requirement for a Postgres backend and real-time websockets where needed.

## NFR-002: Zero-Friction Setup
**Requirement:** The project MUST run locally via a single command with no complex database initialization required. The Postgres schema MUST be auto-generated or migrated automatically.
**Rationale:** Lowers the barrier to entry for developers per the AGENTS.md "Zero-Friction Setup" principle.

## NFR-003: Privacy by Design
**Requirement:** The application MUST NOT track individual user exploration paths or use third-party analytics cookies. Auth via Talon.js MUST prioritize local/secure credential handling.
**Rationale:** Ensures "Privacy by Design" as mandated in AGENTS.md.

## NFR-004: Test-Driven Extensibility
**Requirement:** All core logic (e.g., dragon kinematics, data fetching) MUST have unit tests, and the rendering engine MUST have UI tests.
**Rationale:** Enforces the "Test-driven development" principle from AGENTS.md.

# Technical Constraints

## TC-001: Technology Stack
**Constraint:** 
- **Frontend:** MUST use HTML5 canvas
- **Websockets:** MUST use geckos.io
- **Auth:** MUST use Talon.js
- **Backend:** MUST use Express.js and Postgres
**Rationale:** User explicitly requested these technologies in the product vision.

## TC-002: API Rate Limits
**Constraint:** Must strictly adhere to the Internet Archive API rate limits.
**Rationale:** To prevent the application IP or user IPs from being blacklisted.

# Out of Scope (For Now)
- Multiplayer/collaborative exploration (seeing other users' dragons).
- Write access to the Internet Archive (uploading files).
- Complex physics simulations beyond basic flocking/steering behaviors.

# Success Criteria
- User can load the web app and begin flying the dragon in under 3 seconds.
- The application fetches and displays at least 10 items from the Internet Archive without visual stuttering.
- The application is entirely purely client-side (static hosting) or utilizes completely serverless cloud functions.

# Release Criteria

## RC-001: Fluid Navigation
**Criteria:** The dragon avatar maintains a steady 60 FPS on standard modern hardware while moving across the canvas.
**Verification:** Run performance profiling during automated UI rendering tests.

## RC-002: Successful Data Retrieval
**Criteria:** When the user intersects a content node, the corresponding Internet Archive metadata is displayed within 2 seconds.
**Verification:** Integration tests utilizing mock network responses and verification of the UI state change.
