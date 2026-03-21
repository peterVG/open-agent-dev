# SRS-COL-001: Node Collision and Data Collection
Feature: Data Collection and Extraction
  As a user
  I want to collide with a celestial node
  So that I can collect data and append it to my tail

  # Happy Path
  Scenario: Successful node collision
    Given I am flying my dragon avatar
    When my avatar's head geometry collides with an Archival Repository node
    Then the dragon's forward kinematics should halt
    And the inverse kinematics loop for the tail tentacles should continue animating
    And a DOM-based profile card should render with metadata

  # User Interaction
  Scenario: Extracting data via landing
    Given a DOM-based profile card is rendered for an Internet Archive node
    When I click the "Land" action button
    Then the node's authoritative external URL should open in a new browser tab
    And the data payload should be appended to my Dragon's visual tail as a bookmark

  # Source
  # - docs/srs.md SRS-COL-001: Node Collision and Data Collection
  # - docs/prd.md F-004: Data Collection and Extraction
