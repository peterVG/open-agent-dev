# Project Requirements Document: Arkrim Dragon

# Executive Summary

Arkrim Dragon is an immersive, infinite-canvas exploratory tool designed to gamify and visualize data discovery. The project enables users to navigate a digital galaxy populated by open data repositories (such as the Internet Archive) by controlling a fluid, continuously flying Dragon avatar. By transforming rote database searching into a satisfying, visual journey, Arkrim Dragon offers a unique educational and ambient gaming experience.

# Product Vision

Arkrim Dragon solves the problem of dry, overwhelming, and uninspiring traditional database searches by providing an interactive, gamified journey through a digital galaxy using a fluid, continuous Dragon avatar.

## Problem Statement

Traditional database searches and archive portals are functional but often overwhelming and uninspiring. Users need a way to visually navigate through different data archives without clicking through traditional lists and links. (Source: [product-vision.md](../docs/product-vision.md), Target Users & Customer Profile)

## Target Users

- Researchers
- Digital archivists
- Students
- Data visualization enthusiasts
- Gamers who enjoy ambient/educational exploration
  (Source: [product-vision.md](../docs/product-vision.md), Target Users & Customer Profile)

# Functional Requirements

## F-001: Infinite Canvas Galaxy Navigation

**Priority:** Mandatory
**User Story:** As a user, I want to visually navigate through a boundless, explorable 2D/3D environment representing a universe of knowledge to discover information visually instead of via traditional lists. (Source: [product-vision.md](../docs/product-vision.md), Core Features / User Requirements)

### Acceptance Criteria

- Canvas allows infinite exploration in 2D/3D space.
- Procedurally generated starfield and orbiting planets are visible.
- Earth origin node is established.

## F-002: Dragon Avatar Control (Powerline Interface)

**Priority:** Mandatory
**User Story:** As a user, I want to control a fluid, continuous flying Dragon avatar with my mouse or keyboard to guide my exploration. (Source: [product-vision.md](../docs/product-vision.md), Core Features / User Requirements)

### Acceptance Criteria

- Dragon avatars swirl smoothly across the screen leaving a visual trail of multiple distinct, chaotic tail strands (meteor streak effect) with varying lengths and brightness.
- The avatar's head geometry must render as a stylized, polygonal dragon with swept-back fins and glowing angular eyes as opposed to a primitive shape.
- Fluid kinematics without visual stutter are achieved.
- Steerable via mouse input and keyboard (arrow keys/WASD).
- Dragon flight speed must be adjustable by the user (e.g., via mouse scroll or +/- keys).

## F-003: Celestial Content Nodes

**Priority:** Mandatory
**User Story:** As a user, I want to discover information by flying my dragon to stars, planets, and galaxies that represent different content repositories. (Source: [product-vision.md](../docs/product-vision.md), Core Features / User Requirements)

### Acceptance Criteria

- Planets, stars, and galaxies represent external archives/datasets.
- Archival Repository planets are graphically distinct from non-archival nodes and use provider-specific colors not used by generic universe nodes: Internet Archive is dark green, Wikimedia is bright blue, and Open Library is dark red.
- Procedural generic planets must feature a randomized number of fading atmospheric rings (1 to 7).
- Background starfield nodes must vary in color with some featuring fading rings, but must exclude the provider-specific archival colors (dark green, bright blue, dark red).
- The canvas must spawn planets at an 80% generic to 20% archival data ratio, maintaining a large minimum spawn distance to prevent visual clustering.
- Canvas displays other dragons (users) traversing the space.

## F-004: Data Collection and Extraction

**Priority:** Mandatory
**User Story:** As a user, I need to be able to extract, view, or save the data I encounter at each celestial node so I can collect items and metadata on my dragon's tail. (Source: [product-vision.md](../docs/product-vision.md), Core Features / User Requirements)

### Acceptance Criteria

- Node collision logic is implemented to collect data nodes.
- Collected items (metadata and content, e.g., image files) are added as small nodes on the dragon's memory bank tail.
- Tail nodes can be made into a "calling card" to jump back to a previously visited Archival Repository planet.
- A "Landing and Data Extraction" GUI overlay reveals content when visiting a planet.
- **Node Connection Dynamics:** When the dragon connects (collides/hovers) with a celestial node, the avatar MUST halt all forward movement, keeping only its flowing tail tentacles animated.
- **Profile Cards:** A small profile "card" UI overlay MUST appear, detailing the node's name, precise media type (e.g. 'Audio', 'Website'), source, and an Internet Archive thumbnail media preview.
- **Landing and Extraction:** The profile card MUST offer the user an option to "land" and explore the environment. Landing MUST open the external resource (e.g., the Internet Archive details page) in a new browser tab.

## F-005: Open Data API Integrations

**Priority:** Mandatory
**User Story:** As a user, I want the celestial bodies to be populated with actual, explorable content from open data APIs. (Source: [product-vision.md](../docs/product-vision.md), Core Features)

### Acceptance Criteria

- Real-time backend connections proxy API requests for the Internet Archive, Wikimedia, and Open Library.

# Technology Stack

- **Frontend (Visuals/Canvas):** SvelteKit with HTML5 canvas
- **Websockets:** geckos.io for UDP/WebRTC style fast multiplayer position syncing (if applicable) or WebSocket fallback.
- **Backend:** FastAPI, SQLite
- **Storage:** DigitalOcean S3 droplets
- **Integrations:** REST/GraphQL APIs for Internet Archive, etc.

# Non-Functional Requirements

## NFR-001: API Rate Limit Compliance

**Requirement:** The system MUST adhere to the rate limits and terms of service of the Internet Archive and other open data providers.
**Rationale:** To prevent IP bans and comply with external API usage terms. (Source: [product-vision.md](../docs/product-vision.md), Standards, Laws, and Regulations)

## NFR-002: Data Privacy Compliance

**Requirement:** The system MUST comply with GDPR/CCPA. Any user exploration history or accounts saved MUST adhere to Privacy by Design architecture.
**Rationale:** Legal requirement for processing user data and protecting user privacy. (Source: [product-vision.md](../docs/product-vision.md), Standards, Laws, and Regulations / AGENTS.md, Privacy by Design)

## NFR-003: Rendering Performance

**Requirement:** The application MUST render the infinite canvas with thousands of data nodes at a stable high framerate in a standard web browser without stutter.
**Rationale:** Fluid kinematics and loading data asynchronously without stutter is a key constraint and unique value proposition. (Source: [product-vision.md](../docs/product-vision.md), Key Constraints / Unfair Advantage)

## NFR-004: Minimize Dependencies & Modularity

**Requirement:** The application MUST restrict external libraries to essential utilities only and be divided into independent modules.
**Rationale:** Ensures maintainability, security, and aligns with the project principles. (Source: AGENTS.md, Minimize Dependencies / Modularity)

## NFR-005: API-First Design

**Requirement:** All frontend and backend communication MUST happen through documented endpoints, enabling future extensibility.
**Rationale:** Facilitates a clear separation of concerns and future 3rd-party integrations. (Source: AGENTS.md, API-First Design)

## NFR-006: Scale-to-Zero Architecture

**Requirement:** Backend services SHOULD minimize running costs when idle.
**Rationale:** To efficiently manage server and hosting costs. (Source: AGENTS.md, Scale-to-Zero)

## NFR-007: Test-Driven Development & Quality Assurance

**Requirement:** All features MUST include robust UI, integration, and performance tests. Code MUST be linted flawlessly.
**Rationale:** Ensures reliability, especially critical for performance limits natively on canvas, maintaining standards for production deployment. (Source: AGENTS.md, Test-Driven Development)

## NFR-008: Portable and Zero-Friction Documentation

**Requirement:** The application MUST be easy to set up locally with automated initialization and interactive auth prompts. All cross-references MUST use strictly relative links.
**Rationale:** Maximizes developer accessibility and code portability. (Source: AGENTS.md, Zero-Friction Setup / Portable Documentation)

# Technical Constraints

## TC-001: WebGL/Canvas Performance Ceiling

**Constraint:** Must render thousands of nodes optimally using HTML5 canvas.
**Rationale:** Standard web browsers limit the rendering bandwidth capable in raw HTML5 canvas; optimization techniques are required to ensure the infinite scrolling Powerline mechanics remain smooth.

## TC-002: API Latency

**Constraint:** Asynchronous loading of data from third-party APIs (like Internet Archive) MUST NOT block the main rendering thread.
**Rationale:** To maintain the fluid kinematics of the dragon without visual UI lag.

# Out of Scope (For Now)

- Premium integrations or HD visual customization (reserved for future freemium tier)
- Real-time multiplayer collaboration (beyond showing other user proxies traversing the space)

# Success Criteria

- Users can smoothly navigate the dragon to discover and extract real archival data without rendering frame drops.
- Users can intuitively collect a data node, attach it to their tail, and use it as a bookmark to return to a repository.
- System handles typical proxy request payload sizes from open APIs within allowed rate limits.

# Release Criteria

## RC-001: Infinite Canvas Rendering

**Criteria:** Standard browser maintains 60 FPS while rendering at least 1,000 background star nodes and the player's animated dragon avatar.
**Verification:** Performance profiling using Chrome DevTools or Playwright tracing.

## RC-002: Archival Data Retrieval

**Criteria:** A player can collide with a content node and successfully append an image/metadata payload retrieved from an open data API.
**Verification:** Integration and manual UI tests simulating end-to-end data retrieval.

# AGENTS.md Principles Integration

The PRD Generator ensures principles defined in AGENTS.md are reflected in product requirements:

- **Minimize Dependencies** → Addressed in NFR-004
- **Scale-to-Zero** → Addressed in NFR-006
- **Test-driven development** → Addressed in NFR-007
- **Security by Design & Privacy by Design** → Addressed in NFR-002
- **API-First Design & Modularity** → Addressed in NFR-004 & NFR-005
- **Zero-Friction Setup & Portable Documentation** → Addressed in NFR-008
