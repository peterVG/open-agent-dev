# Project Requirements Document: RRSP Tracker

# Executive Summary
The RRSP Systemic Resilience Tracker is a personal financial intelligence tool designed to manage a CAD RRSP portfolio with a total 15 year window of investment with 36-month tactical windows. The app focuses on a 70% Aggressive / 30% Safe split, specifically engineered to hedge against systemic risks like U.S. debt inflation and AI infrastructure overvaluation while capturing gains from trends like the "AI Productivity Diffusion" phase.

# Product Vision
To provide a sovereign, local-first dashboard that transforms raw global market data into actionable investment signals, ensuring the user can pivot between aggressive growth and capital preservation based on real-time "Expert Intel" and AI-driven macro analysis.

## Problem Statement
The user needs to manage an RRSP portfolio defensively and aggressively, reacting to systemic risks and trends, but lacks an automated, sovereign, local-first tool to ingest market data and expert intel to generate actionable investment signals.

## Target Users
Personal Investor / Portfolio Manager

# Functional Requirements

## FR-001: AI Intelligence Engine (Gemini 3.1 Pro)
**Priority:** Mandatory
**User Story:** As an investor, I want the system to scan the web based on my active investment thesis and current holdings to generate support rankings so that I can make informed rebalancing decisions.

### Acceptance Criteria
- Determine the currently active investment thesis by checking the [`/docs/theses/`](./theses/) folder for files following conventions "investment-thesis-X.md" and selecting the highest version number.
- Use Gemini to scan the web every hour for content related to the active investment thesis and stock holdings.
- Capture full-text transcript, author name(s), date of publication, source URL, and a brief summary in the local database.
- Capture timestamp of source capture; do not re-capture existing sources on restart.
- Ignore all sources already in the database.
- Provide a support ranking for each source: "supports" (green), "challenges" (orange), "neutral" (yellow), or "rebalance" (red - reserved for Critical Rebalance Triggers).
- Provide live feedback in the UI during scans (evaluations, captures, ignored, new).

## FR-002: Multi-Tab Interface (Streamlit)
**Priority:** Mandatory
**User Story:** As an investor, I want a multi-tab dashboard to view my portfolio metrics and Gemini intelligence engine status so that I can monitor my investments seamlessly.

### Acceptance Criteria
- Tab 1: Must render baseline portfolio metrics immediately upon load.
- Tab 1: Integrate `yfinance` to pull live prices for tickers: PHYS, POWR, RSP, TBT, VGSH.
- Tab 1: Display a "Live Ticker Monitoring" table for all positions (including book value) with a toggle to prevent startup lag.
- Tab 1: In edit mode, the user can add, update, or delete existing positions. In view mode, the user can only view the positions.
- Tab 2: Feature a Live API Console that provides visual feedback (Blue/Yellow/Green/Red) on the Gemini API status (Working, Success, Error).
- Tab 2: Display a table of all captured sources with columns for title, author, date, url, support ranking, and a button to view full text. Support pagination and column sorting (default sort by date descending).

## FR-003: Data & Persistence
**Priority:** Mandatory
**User Story:** As a user, I want all intelligence and portfolio snapshots stored locally so that my data remains sovereign and private.

### Acceptance Criteria
- All intelligence and portfolio snapshots must be stored in a local SQLite database (`rrsp_tracker.db`).
- No user authentication or external server requirements; the app must run on localhost.

## Technology Stack
- **Language:** Python 3.10+
- **Frontend:** Streamlit (Multi-tab, reactive fragments)
- **Backend API:** FastAPI (MAY be used if necessary beyond Streamlit capabilities)
- **Database:** SQLite (Local file-based storage)
- **AI:** Google Gemini 3.1 Pro (via `google-generativeai` SDK)
- **Market Data:** `yfinance` API

# Non-Functional Requirements

## NFR-001: Non-Blocking UI
**Requirement:** The app must populate the screen structure first. Heavy tasks (Gemini scans) must be triggered via a button or lazy-loaded.
**Rationale:** To provide a smooth user experience and prevent the application from appearing unresponsive.

## NFR-002: API Transparency
**Requirement:** The app must explicitly report `429` (Rate Limit) or `402` (Funding Required) errors to the user via the Status Console.
**Rationale:** The user needs to know exactly why the AI engine might fail or pause.

## NFR-003: Noisy Debugging
**Requirement:** Support for `--logger.level=debug`.
**Rationale:** To troubleshoot local hanging issues effectively.

# Technical Constraints

## TC-001: Local Sovereignty
**Constraint:** No user authentication or external server requirements; the app must run on localhost.
**Rationale:** To ensure absolute privacy and control over financial data.

## TC-002: Local Storage
**Constraint:** Must use SQLite (`rrsp_tracker.db`).
**Rationale:** File-based local storage ensures simplicity and matches the local-first requirement.

## Out of Scope (For Now)
- External cloud database syncing
- Multi-user authentication

# Initial Strategy & Portfolio Baseline
- **Total Capital:** $72,000 CAD (plus $20,000 annual top-ups).
- **Aggressive Allocation (70%):** Focused on $POWR (Infrastructure), $RSP (Equal-Weight S&P), $IJP (Japan), and $PSQ (Short Nasdaq).
- **Safe Allocation (30%):** Focused on $PHYS/$PSLV (Physical Bullion) and $VGSH (Short-term Treasuries).
- **Key Tactic:** Use of Norbert’s Gambit ($DLR.TO$) for cost-efficient CAD/USD conversion.
