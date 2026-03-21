# Architecture Decision Record - Arkrim Dragon
006-websocket-sync-protocol.md

## Title: 006 - Real-Time WebSockets Protocol
## Status: Accepted
## Context / Requirement Reference:
The `docs/prd.md` document requires real-time multiplayer positional syncing (or fallback multiplexing) to show other user proxies traversing the infinite canvas efficiently.

## Decision:
We implement `geckos.io` for UDP/WebRTC style multiplexed positional syncing, utilizing the standard WebSocket fallback over TCP natively.

## Rationale:
Standard Socket.io relies exclusively on TCP overhead which degrades sharply across WebGL canvas updates sending raw matrix coordinate transformations 60 times a second. `geckos.io` utilizes WebRTC data channels natively providing near-UDP transmission speeds structurally suited for high-frequency avatar kinematics.

## Assumptions:
Assumes the FastAPI backend handles WebRTC signaling channels effectively or relies on standard WebSocket fallbacks during strict firewall encounters.

## Alternatives Considered:
- **Socket.io**: Rejected due to high TCP polling latencies not inherently suited for massive 60-FPS streaming coordinates.

## Consequences / Implications:
Requires specific port allocations for WebRTC data channels in the Docker infrastructure.

## Related Decisions / Notes:
See `005-core-technology-stack.md`
