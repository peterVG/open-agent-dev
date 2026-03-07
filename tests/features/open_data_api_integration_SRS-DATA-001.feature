Feature: Open Data API Integration
  As a system process
  I need to fetch metadata from the Internet Archive REST API
  To populate the celestial nodes

  @SRS-DATA-001.1
  Scenario: Fetching metadata via Express.js proxy
    Given the Express.js proxy is running
    When the application requests celestial node data for a given region
    Then the Express.js proxy should query the Internet Archive API
    And return the cached or fresh metadata to the client
    And the UI should display a loading state until the data is resolved

# Source
# - srs.md SRS-DATA-001 Celestial Content Nodes and Integration
# - prd.md F-003, F-004 Open Data API Integration
