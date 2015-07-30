Feature: Artist manages Posts
  As an Artist
  I want to create a Post
  So that I can publish my work
  @javascript
  Scenario: Successfully create a Post
    Given I am a signed in Artist
    And I have no posts
    And I go to create a Post
    When I fill in all Post details
    Then my Post is created
