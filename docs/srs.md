# Software Requirements Specification: Arkrim Dragon

## 1. Introduction

This Software Requirements Specification (SRS) defines the technical requirements for the Arkrim Dragon project. It translates the business and user needs outlined in the Product Requirements Document (PRD) into verifiable, unambiguous, and traceable technical constraints, adhering to ISO/IEC/IEEE 29148 standards and using RFC 2119 terminology.

## 2. Functional Requirements

### SRS-NAV-001: Infinite Canvas Rendering

The frontend MUST render a boundless 2D/3D environment using HTML5 Canvas. The canvas MUST procedurally generate background star nodes and distinct celestial bodies as the user navigates.

- **Source:** [`[prd.md]`](../docs/prd.md) F-001 Infinite Canvas Galaxy Navigation
- **Tests:** [`infinite_canvas_srs-nav-001.feature`](../tests/features/infinite_canvas_srs-nav-001.feature)

### SRS-AVT-001: Dragon Avatar Kinematics

The frontend MUST implement a continuously flying Dragon avatar controlled by user mouse input and keyboard (arrow keys/WASD). The user MUST be able to dynamically increase or decrease the dragon's movement speed. The rendering loop MUST output smooth kinematic movements via an inverse-kinematics multi-tail representation (meteor streak effect) without frame stuttering. Furthermore, the avatar MUST utilize custom canvas paths to draw a polygonal head geometry (fins, snout, eyes) that visually rotates according to the heading vector, as opposed to using a basic primitive shape.

- **Source:** [`[prd.md]`](../docs/prd.md) F-002 Dragon Avatar Control
- **Tests:** [`avatar_control_srs-avt-001.feature`](../tests/features/avatar_control_srs-avt-001.feature)

### SRS-NOD-001: Celestial Node Generation

The system MUST represent different content repositories as visually distinct planets, stars, and galaxies on the canvas. Archival Repository nodes MUST be colored according to their provider (Internet Archive is dark green, Wikimedia is bright blue, Open Library is dark red). Background procedural stars MUST feature varied colors and optional fading rings, but MUST NOT generate in the provider-specific color spectrums (e.g. dark green, bright blue, dark red). The generation MUST enforce an 80/20 spawn ratio for generic vs archival nodes, allocate significant minimum spacing between them, and assign procedural generic planets 1 to 7 variable-opacity atmospheric rings.

- **Source:** [`[prd.md]`](../docs/prd.md) F-003 Celestial Content Nodes
- **Tests:** [`node_generation_srs-nod-001.feature`](../tests/features/node_generation_srs-nod-001.feature)

### SRS-COL-001: Node Collision and Data Collection

The frontend MUST implement bounding-box or radius-based collision detection between the Dragon avatar's head and canvas nodes. Upon collision:
1. The Dragon's forward kinematics MUST halt (speed set to 0), while ensuring the inverse kinematics loop for the tail tentacles continues animating.
2. A DOM-based profile "card" MUST render, providing an image thumbnail preview alongside the node's metadata (Name, precise Media Type, Source). It MUST supply a "Land" action button.
3. If "Land" is triggered, the frontend MUST open the node's authoritative external URL in a new browser tab.
4. The data payload representing the node MAY be appended to the Dragon's visual tail as a bookmark.

- **Source:** [`[prd.md]`](../docs/prd.md) F-004 Data Collection and Extraction
- **Tests:** [`data_collection_srs-col-001.feature`](../tests/features/data_collection_srs-col-001.feature)

### SRS-INT-001: Open Data Proxy API

The FastAPI backend MUST expose a RESTful or GraphQL proxy API to fetch real-time data from external providers (Internet Archive, Wikimedia, Open Library).

- **Source:** [`[prd.md]`](../docs/prd.md) F-005 Open Data API Integrations
- **Tests:** [`proxy_api_srs-int-001.feature`](../tests/features/proxy_api_srs-int-001.feature)

## 3. Non-Functional Requirements

### SRS-NFR-001: API Rate Limiting

The backend proxy MUST implement rate limiting and caching strategies (e.g., using Redis or in-memory LRU) to ensure external API requests do not exceed the permitted quotas of the Internet Archive and other open data providers.

- **Source:** [`[prd.md]`](../docs/prd.md) NFR-001 API Rate Limit Compliance
- **Tests:** [`rate_limiting_srs-nfr-001.feature`](../tests/features/rate_limiting_srs-nfr-001.feature)

### SRS-NFR-002: WebGL/Canvas Performance

The HTML5 Canvas application MUST maintain a minimum of 60 frames per second (FPS) on standard desktop browsers while rendering at least 1,000 background objects and the moving avatar.

- **Source:** [`[prd.md]`](../docs/prd.md) NFR-003 Rendering Performance
- **Tests:** [`rendering_performance_srs-nfr-002.feature`](../tests/features/rendering_performance_srs-nfr-002.feature)

### SRS-NFR-003: Asynchronous Data Loading

The frontend MUST fetch external data payloads from the backend proxy asynchronously. These network requests MUST NOT block the main JavaScript browser execution thread responsible for the canvas render loop.

- **Source:** [`[prd.md]`](../docs/prd.md) TC-002 API Latency
- **Tests:** [`async_loading_srs-nfr-003.feature`](../tests/features/async_loading_srs-nfr-003.feature)

### SRS-NFR-004: Zero-Friction Setup

The project initialization process MUST automatically provision the local SQLite database and apply all schema migrations without manual user intervention. It MUST interactively prompt for any missing required `.env` variables.

- **Source:** [`[prd.md]`](../docs/prd.md) NFR-008 Portable and Zero-Friction Documentation
- **Tests:** [`zero_friction_setup_srs-nfr-004.feature`](../tests/features/zero_friction_setup_srs-nfr-004.feature)

### SRS-NFR-005: Data Privacy

The backend MUST NOT store personally identifiable information (PII) regarding the user's specific exploration history in persistent storage (SQLite/DigitalOcean S3) without explicit, auditable consent, conforming to GDPR/CCPA standards.

- **Source:** [`[prd.md]`](../docs/prd.md) NFR-002 Data Privacy Compliance
- **Tests:** [`data_privacy_srs-nfr-005.feature`](../tests/features/data_privacy_srs-nfr-005.feature)

### SRS-NFR-006: Scale-To-Zero

Backend FastAPI functions SHOULD be structured to deploy as serverless functions or containers that scale down to zero active instances when no WebSocket or HTTP connections are present.

- **Source:** [`[prd.md]`](../docs/prd.md) NFR-006 Scale-to-Zero Architecture
- **Tests:** [`scale_to_zero_srs-nfr-006.feature`](../tests/features/scale_to_zero_srs-nfr-006.feature)

## 4. Technical Constraints & Stack

- **Frontend (Visuals/Canvas):** SvelteKit with HTML5 canvas
- **Websockets:** geckos.io for UDP/WebRTC style fast multiplayer position syncing (if applicable) or WebSocket fallback.
- **Backend:** FastAPI, SQLite
- **Storage:** DigitalOcean S3 droplets
- **Integrations:** REST/GraphQL APIs for Internet Archive, etc.
