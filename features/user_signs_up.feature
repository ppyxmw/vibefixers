Feature: User signs up
  As a User
  I want to sign up
  So that my account saves my preferences

  Scenario: Successful sign up as
    Given I am not signed up
    When I provide my details
    Then my account is created
    And I receive a confirmation email
    And I am shown my profile

  Scenario: Unsuccessful sign up
    Given I am not signed up
    When I provide invalid details
    Then I am told to correct my details

  Scenario: Customer obtains their forgotten password
    Given I am signed up
    When I have forgotten my password
    Then I receive a password reset email
    And I change my password

