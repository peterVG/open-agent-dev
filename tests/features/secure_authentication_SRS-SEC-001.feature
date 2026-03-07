Feature: Secure Local Authentication
  As a user
  I want my credentials handled securely and locally
  So that my privacy is maintained during exploration

  @SRS-SEC-001
  Scenario: Talon.js authentication integration
    Given the user is interacting with the Memory Garden frontend
    When the user authenticates using Talon.js
    Then the local credentials should be handled securely on the client
    And the Express.js backend should validate the authentication for API and Websocket access

# Source
# - srs.md SRS-SEC-001 Security and Authentication
# - prd.md NFR-003 Privacy by Design
