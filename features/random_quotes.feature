Feature: Random Quotes
  In order to fake my knowledge of the world to my Twitter followers
  As a visitor of the I <3 Kabisa service
  I want to be able to view a (random) quote

  Scenario: Visit quote page
    Given I know my way around the interwebs
    When I visit the I <3 Kabisa website
    Then I should be greeted by a quote
