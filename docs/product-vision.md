# Arkrim Dragon: Product Vision

## Product Vision

**Description:** What is this product meant to achieve? Why should it exist?

> The Arkrim Dragon is an immersive, infinite-canvas exploratory tool designed to gamify and visualize data discovery. It exists to transform how users interact with vast amounts of information from open data repositories (like the Internet Archive) by turning rote searching into an interactive, visually stunning journey through a digital galaxy.

## Core Features

**Description:** What is the product's main functionality?

> - **Infinite Canvas Galaxy:** A boundless, explorable 2D/3D environment representing a universe of knowledge.
> - **Dragon Avatar (Powerline Interface):** Users control a dragon that swirls smoothly across the screen in a Powerline-type arcade mechanic, leaving a visual trail and collecting or interacting with data. Implement a fluid, continuously flying Dragon avatar on the canvas that the user can steer with their mouse. Incorporate node collision logic to collect data nodes into a memory bank representing the dragon's tail. The Dragon's trail should have multiple tentacles like a jellyfish.
> - **Collect information:** The user is able to collect items from the canvas, including their metadata and content (e.g image files) and add it as small nodes on its own tail. That includes making a tail node into a "calling card" for an Archival Repository planet it may have encountered, allowing the user to jump back to that planet.
> - **Celestial Content Nodes:** Planets, stars, and galaxies represent different content repositories, archives, and datasets.
> - **Open Data API Integrations:** Real-time backend connections to open data APIs (e.g., Internet Archive, Wikimedia, Open Library) to populate the celestial bodies with actual, explorable content.
> - **Upgrading the infinite canvas into a futuristic starfield:** Establishing an Earth origin node, and introducing procedurally generated, orbiting planets with a new "Landing and Data Extraction" GUI overlay.
> - **Distinguishing Archival Repository planets from others:** The user may encounter various planets and celestial bodies and other dragons (users) in their canvas space. Those planets that Archival Repisotories should be graphically distinct from those that are not.

## User Requirements

**Description:** "I want", "I need" statements.

> - I want to visually navigate through different data archives without clicking through traditional lists and links.
> - I need a fluid, satisfying control system (like the classic Powerline/Snake mechanic) to guide my exploration.
> - I want to "discover" information by flying my dragon to a star or planet.
> - I need to be able to extract, view, or save the data I encounter at each celestial node.

## Technical Stack

**Description:** Technologies and tools used.

- **Frontend (Visuals/Canvas):** SvelteKit with HTML5 canvas
- **Websockets:** geckos.io for UDP/WebRTC style fast multiplayer position syncing (if applicable) or WebSocket fallback.
- **Backend:** FastAPI, SQLite
- **Storage:** DigitalOcean S3 droplets
- **Integrations:** REST/GraphQL APIs for Internet Archive, etc.

## Standards, Laws, and Regulations

**Description:** Applicable legal rules and technical standards.

> - **API Terms of Service:** Must adhere to the rate limits and terms of the Internet Archive and other open data providers.
> - **Data Privacy:** GDPR/CCPA compliance if user exploration history or accounts are saved.

## Technical & Legal References

**Description:** Link to existing files in the /kb folder or upload external documentation.

> - [Internet Archive API Documentation](https://archive.org/help/aboutsearch.htm)

## Target Users & Customer Profile

**Description:** Define the niche, customer jobs, pains, and gains.

> **Target Audience:** Researchers, digital archivists, students, data visualization enthusiasts, and gamers who enjoy ambient/educational exploration.
> **Pains Solved:** The dry, overwhelming, and uninspiring nature of traditional database searches.

## Value Propositions

**Description:** What problem are you solving and how do you eliminate pain points?

> By gamifying data exploration, Memory Garden lowers the barrier to entry for interacting with massive historical archives. It turns data consumption into an aesthetic, relaxing, and serendipitous journey.

## Unfair Advantage / The Moat

**Description:** What makes this unique or difficult to copy?

> The highly specific, creative UI/UX combination of a "Powerline dragon" integrated deeply with serious data APIs. Executing the fluid kinematics of the dragon while loading data asynchronously without visual stutter is technically challenging.

## Key Constraints

**Description:** Money, time, or regulatory restrictions.

> - API Rate Limits from external open data sources.
> - Rendering performance of an infinite canvas with thousands of data nodes in a standard web browser.
> - UI complexities in balancing a "game" interface with "reading" archival content.

## Market Analysis

**Description:** Potential size, difficulty to sell, and evidence of paying clients.

> The ed-tech and data-visualization market is large. While primarily a niche experiential tool, it can be licensed to libraries, educational institutions, or digital museums as an interactive exhibit.

## Key Competitors

**Description:** Who else is addressing this need and what is their model?

> - Traditional search engines and archive portals (functional but not gamified).
> - Experimental data viz projects (e.g., Musicxmatch galaxy, GitHub visualizer).

## Revenue Streams

**Description:** How does this product earn money? (SaaS, licensing, etc.)

> - Institutional licensing (museums, universities).
> - Freemium model (basic APIs free, premium integrations or HD visual customization behind a paywall).
> - Open-source sponsorships / Grants (e.g., from digital preservation societies).

## Sales Channels

**Description:** How do you reach and deliver value to customers?

> - Direct outreach to digital humanities departments and libraries.
> - Viral marketing through visually striking WebGL demos on social media (X, Reddit, TikTok).

## Key Resources & Partnerships

**Description:** IP, specialized developers, cloud providers, or legal counsel.

> - Partnerships with the Internet Archive or other open data outfits.
> - Creative developers skilled in generative art and WebGL.

## Cost Structure

**Description:** Key costs, fixed vs. variable, and minimization strategies.

> - Server/hosting costs for proxying API requests and serving the web app.
> - Design and animation assets for the dragon and cosmos.

## Key Metrics

**Description:** Numbers and criteria to track success or failure.

> - Active API queries initiated through gameplay.
> - Average session length (exploration time).
> - Number of celestial bodies visited per session.
