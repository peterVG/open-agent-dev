# SRS-AVT-001: Dragon Avatar Kinematics
Feature: Dragon Avatar Control
  As a user
  I want to control a fluid, continuous flying Dragon avatar
  So that I can satisfyingly guide my exploration

  # Happy Path
  Scenario: Standard avatar control
    Given I am exploring the canvas
    When I press the arrow keys
    Then the dragon avatar's head geometry should visually rotate according to the heading vector
    And the movement should exhibit fluid kinematics without frame stuttering

  # Happy Path
  Scenario: Dynamic speed adjustment
    Given I am flying my dragon avatar
    When I scroll my mouse wheel upwards
    Then the dragon's forward movement speed should dynamically increase
    And the distinct chaotic tail strands should stretch correctly

  # Source
  # - docs/srs.md SRS-AVT-001: Dragon Avatar Kinematics
  # - docs/prd.md F-002: Dragon Avatar Control (Powerline Interface)
