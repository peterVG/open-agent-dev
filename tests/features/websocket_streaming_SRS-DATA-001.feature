Feature: Real-time Data Streaming
  As an explorer
  I want to see new celestial nodes appear dynamically
  So that the universe feels alive and updated

  @SRS-DATA-001.2
  Scenario: Streaming nodes via Geckos.io websockets
    Given an established UDP/WebRTC data channel via Geckos.io
    When the Express.js backend discovers new data from the Internet Archive
    Then a websocket message should be pushed to the client
    And a new celestial node should be rendered on the HTML5 canvas

# Source
# - srs.md SRS-DATA-001.2 Real-time Data Streaming
# - prd.md TC-001 Technology Stack
