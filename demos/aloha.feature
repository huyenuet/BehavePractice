# Created by gotitinc at 8/8/18
Feature: gip-560: As a potential user, I want to see pricing consistent with my sales call with the Got It sales person
  in order to be incentivized to make a purchase over the phone.
  1. Create a new economy group EG14 for the telesales site on its own
  2. No free trial economy group (A0Q0)


  Scenario: User makes a purchase over the phone from telesales landing page will be set to EG14
    Given I made a purchase over the phone from telesales landing page
    When  I log into my account
    Then  I should see the EG14 storefront
    And   I should not have any free sessions


  Scenario: User makes a phone call successfully from telesales landing page
    Given I am at the telesales landing page
    When  I click on Call button
    And   I click open facetime.app
    Then  Facetime app should open
    And   My call to Got It sales should be connected successfully

  Scenario: Check hard-code storefront on telesales landing page
    Given   I am at the telesales landing page
    Then    I should see the EG14 storefront
    And     Storefront contains 3 packages which are for team only

# note:
  package 1 : 1 user, $29.99 month, $14.99 annual
  package 2 : 2-50 users $19.99 / month / user, $11.99 / month / user annual
  package 3 : 51-100 users $17.99 / month / user, $10.99 / month / user annual

  Scenario: Check storefront at /pricing when EG14 users log in to their account
    Given   I am an user created by admin over phone call
    When    I log into my account
    And     I click on pricing tab
    Then    I should see the storefront contains 3 packages which are for team only

"""
Gip 561:
On the new landing page, there is a contact me form which accepts user information
When a user submits this, the following should happen:
- Information is stored in the database in a new table
- Content of the form is sent on slack to the #telesales channel
"""

  Scenario: User submits successfully the "contact me" form => data will be stored in  table telesales_contacts of database
    Given   I am at the telesales landing page
    When    I enter all valid information in "contact me" form
    And     I click submit that form
    Then    My data should be stored in database, table telesales_contacts

  Scenario: User submits successfully the "contact me" form => Content of the form will be sent to the #telesales channel on slack
    Given   I am at the telesales landing page
    When    I enter all valid information in "contact me" form
    And     I click submit that form
    Then    Content of that form should be sent to the #telesales channel on slack

  Scenario: User submits unsuccessfully the "contact me" form => data will not be stored in  table telesales_contacts of database
    Given   I am at the telesales landing page
    When    I enter at least one invalid information in "contact me" form
    And     I click submit that form
    Then    I should see the error message
    And     My data should not be stored in table telesales_contacts of database

  Scenario: User submits unsuccessfully the "contact me" form => Content of the form will not be sent to #telesales channel on slack
    Given   I am at the telesales landing page
    When    I enter at least one invalid information in "contact me" form
    And     I click submit that form
    Then    I should see the error message
    And     Content of that form should not be sent to the #telesales channel on slack