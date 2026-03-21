# SRS-NFR-003: Asynchronous Data Loading
Feature: API Latency & Async Loading
  As a player
  I want massive external API payloads to load invisibly
  So that my browser execution thread is not blocked during flight

  # Happy Path
  Scenario: Background fetching large metadata
    Given I am flying my dragon avatar at maximum speed
    When the frontend initiates a network request for a 5MB payload from the backend
    Then the network request MUST NOT block the main JavaScript browser execution thread
    And the canvas render loop must continue ticking unobstructed

  # Source
  # - docs/srs.md SRS-NFR-003: Asynchronous Data Loading
  # - docs/prd.md TC-002: API Latency
