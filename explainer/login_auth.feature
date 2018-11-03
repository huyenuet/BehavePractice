# Created by gotitinc at 7/16/18
Feature: As a existing expert, I want to login to expert portal
  # Enter feature description here

@fixture.chrome.browser
  Scenario: login successfully with email
    Given I am at the expert landing
    When  I click on the login button
    And   I enter correct email and correct password
    And   I click on the login submit button
    And   I accept the term and condition
    Then  I should be redirected to the homepage

  Scenario: login fail
    Given I am at the expert landing
    When I click logo button