Feature: Infinite Canvas Galaxy Navigation
  As an explorer
  I want to traverse a boundless 2D/3D environment
  So that I can feel a sense of scale and freedom when discovering information

  @SRS-NAV-001
  Scenario: Continuous Panning
    Given the Memory Garden application is loaded on an HTML5 canvas
    When the user pans the camera in any direction continuously
    Then the viewport should translate without encountering a boundary
    And celestial nodes should load dynamically based on the viewport coordinates

# Source
# - srs.md SRS-NAV-001 Infinite Canvas Galaxy Navigation
# - prd.md F-001 Infinite Canvas Galaxy Navigation
