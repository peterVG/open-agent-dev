# SRS-NFR-001: API Rate Limiting
Feature: API Rate Limit Compliance
  As a backend service operator
  I want the proxy to enforce rate limiting against open datasets
  So that I comply with external API quotas and avoid IP bans

  # Happy Path
  Scenario: Standard request proxying
    Given the backend proxy is receiving client requests
    When the request volume is below 10 requests per second
    Then the proxy should dynamically forward requests to the Internet Archive
    And the responses should be returned successfully

  # Edge Case
  Scenario: Exceeding permitted quotas
    Given the backend proxy is receiving client requests
    When the request volume suddenly peaks to 100 requests per second
    Then the proxy should engage caching strategies (e.g., Redis or in-memory LRU)
    And the proxy should return cached or rate-limited HTTP 429 errors 
    And the external provider MUST NOT receive the excessive traffic

  # Source
  # - docs/srs.md SRS-NFR-001: API Rate Limiting
  # - docs/prd.md NFR-001: API Rate Limit Compliance
