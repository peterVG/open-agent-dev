Feature: Dragon Avatar Control (Powerline Interface)
  As an explorer
  I want to control a fluid, continuous avatar
  So that navigation is engaging and satisfying

  @SRS-CTRL-001
  Scenario: Smooth continuous avatar steering
    Given the user has loaded the infinite canvas
    When the user provides directional input
    Then the dragon avatar should steer continuously
    And leave a visual trail on the HTML5 canvas
    And the rendering frame rate should remain near 60 FPS

# Source
# - srs.md SRS-CTRL-001 Dragon Avatar Control
# - prd.md F-002 Dragon Avatar Control
