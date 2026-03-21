# SRS-NOD-001: Celestial Node Generation
Feature: Celestial Content Nodes
  As a user
  I want to encounter distinct planets representing archives
  So that I can visually distinguish content providers

  # Happy Path
  Scenario: Provider specific coloring
    Given the procedural generator spawns an Internet Archive planet
    When the planet is rendered on the canvas
    Then the planet color should be strictly dark green
    
  # Edge Case
  Scenario: Spawn ratio enforcement
    Given the procedural generator runs continuously
    When it spawns 100 celestial nodes
    Then approximately 80 should be generic procedural planets or stars
    And approximately 20 should be Archival Repository planets
    And they should maintain a large minimum spawn distance

  # Source
  # - docs/srs.md SRS-NOD-001: Celestial Node Generation
  # - docs/prd.md F-003: Celestial Content Nodes
