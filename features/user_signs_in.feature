Feature: User signs up
  As a User
  I want to sign up
  So I can access my personal settings

    Scenario: Successful sign in
      Given I am signed up
      And I am not signed in
      When I sign in with my email address
      Then I am shown my account
