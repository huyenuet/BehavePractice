# Created by gotitinc at 8/1/18
Feature: As a new user, I want to be able to call a phone number to inquire about Excelchat
  in order to decide whether or not I want to make a purchase

  Scenario: New user to see "Try it now" button is replaced with non-functional text
    Given   I am not logged in
    And     I am at Excel-help page
    Then    I see "Try it now" button on the header is replaced with phone number
    When    I click on phone number
    Then    The phone number is non-functional

  Scenario: New user to see new design element below the ask box
    Given   I am not logged in
    And     I am at Excel-help page
    Then    I see new design element below the ask box

