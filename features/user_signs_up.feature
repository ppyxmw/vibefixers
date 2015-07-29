Feature: User signs up
  As a User
  I want to sign up
  So that my account saves my preferences

  Scenario: Successful sign up as an Artist
    Given I am not signed up
    When I provide my details
    Then my artist account is created
    And I receive a confirmation email
    And I am shown my new profile

  Scenario: Successful sign up as a Fan
    Given I am not signed up
    When I provide my details
    Then my fan account is created
    And I am shown my new profile
    And I receive a confirmation email


  Scenario: Unsuccessful sign up
    Given I am not signed up
    When I provide invalid details
    Then I am notified of an error

  Scenario: Customer obtains their forgotten password
    Given I am signed up
    When I have forgotten my password
    Then I receive a password reset email
    And I change my password
