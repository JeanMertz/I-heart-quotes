# encoding: UTF-8

Feature: Random Quotes
  In order to fake my knowledge of the world to my Twitter followers
  As a visitor of the I ♥ Kabisa service
  I want to be able to view a random quote

  Background: Quote source and cached quote exist
    Given a quote source is available to the service
    And a cached quote exists in the database

  @skip @vcr
  Scenario: External quotes are shown on the page
    Given the cached quote weight is set to 0
    When I visit the I ♥ Kabisa website
    Then I should be greeted by a quote

  @vcr
  Scenario: Cached quotes are shown on the page
    Given the cached quote weight is set to 100
    When I visit the I ♥ Kabisa website
    Then I should be greeted by a quote

  @vcr
  Scenario: Permalink redirects to internal page
    When I visit the I ♥ Kabisa website
    And I click the permalink
    Then I should be redirected

  @vcr
  Scenario: Sourcelink is visible to user
    When I visit the I ♥ Kabisa website
    Then a sourcelink should be visible

  @skip @vcr @multiple_recordings
  Scenario: Displayed quotes are random
    Given the cached quote weight is set to 50
    When I visit the I ♥ Kabisa website
    And I reload the page "10" times
    Then I should see at least two different quotes
