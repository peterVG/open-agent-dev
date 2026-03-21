# SRS-NFR-005: Data Privacy
Feature: Privacy by Design Rules
  As a user exploring the galaxy
  I want my exploration history and digital footprint scrubbed
  So that my privacy is legally and structurally protected

  # Happy Path
  Scenario: Exploration without tracking
    Given I traverse multiple Archive nodes and download data
    When my session is active
    Then the backend MUST NOT store personally identifiable information (PII) regarding my specific path
    And no persistent tracking logs should write to the SQLite database

  # Source
  # - docs/srs.md SRS-NFR-005: Data Privacy
  # - docs/prd.md NFR-002: Data Privacy Compliance
