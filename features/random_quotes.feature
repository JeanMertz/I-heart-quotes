Feature: Random Quotes
  In order to fake my knowledge of the world to my Twitter followers
  As a visitor of the I <3 Kabisa service
  I want to be able to view a random quote

  Scenario: Visit quote page
    Given I know my way around the interwebs
    When I visit the I <3 Kabisa website
    Then I should be greeted by a quote

  Scenario: Click permalink
    Given I am on the random quotes page
    When I click the permalink
    Then I should be redirected

  Scenario: Click sourcelink if visible
    Given I am on the random quotes page
    And a sourcelink is visible
    When I click the sourcelink
    Then I should be redirected

  Scenario: Check quote randomness
    Given I am on the random quotes page
    When I reload the page "10" times
    Then I should see at least two different quotes
