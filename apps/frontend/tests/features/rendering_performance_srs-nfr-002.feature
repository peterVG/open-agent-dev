# SRS-NFR-002: WebGL/Canvas Performance
Feature: Rendering Performance Ceiling
  As a player
  I want the infinite canvas to render smoothly
  So that the fluid kinematics of the dragon feel deeply satisfying

  # Happy Path
  Scenario: Maintaining high framerate with heavy node counts
    Given the HTML5 Canvas application is rendering a standard desktop browser viewport
    When the viewport contains at least 1,000 background objects and the moving avatar
    Then the render loop should maintain a minimum of 60 frames per second (FPS)
    And no visible frame stuttering or UI lag should engage

  # Edge Case
  Scenario: Extreme hardware degradation
    Given the HTML5 Canvas application is running on a low-end device
    When the physics loop cannot maintain 30 FPS
    Then the application should gracefully degrade visual particle counts (meteor streaks)
    And the core avatar movement should remain responsive

  # Source
  # - docs/srs.md SRS-NFR-002: WebGL/Canvas Performance
  # - docs/prd.md NFR-003: Rendering Performance
