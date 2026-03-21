# SRS-NFR-006: Scale-To-Zero
Feature: Scale-To-Zero Architecture
  As a system administrator
  I want the FastAPI backend to sleep when idle
  So that I only pay for computing power when users are active

  # Happy Path
  Scenario: Automatic scaling of inactive processes
    Given the FastAPI environment is actively deployed as a serverless fleet
    When there are absolutely zero WebSocket or active HTTP connections present
    Then the scaling balancer should structure deployments down to zero active instances
    And idle server computing costs should flatline

  # Source
  # - docs/srs.md SRS-NFR-006: Scale-To-Zero
  # - docs/prd.md NFR-006: Scale-to-Zero Architecture
