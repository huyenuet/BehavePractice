# Created by gotitinc at 7/17/18
Feature: As an asker, if I enable data obfuscation, my sensitive data should be encrypted
  this feature is only for spreadsheet, not the content of chat messages
  1. Obfuscate credit card numbers
  2. Replace each digit in social security numbers with "2"
  3. Track changes made to an obfuscated file and store the meta data in a separate file. The meta data file maybe use
  to decrypt (decode)
  4. Log the account, user, session and time of obfuscation for auditing purposes.

  Background: I am an asker
    Given I logged in as an asker

  # C29198
  Scenario: If data obfuscation is on, only [Mask Credit Card Numbers] is checked and my file contains credit card number(CCN) and social security number(SSN) => CCN should be replaced with "Hidden value", SSN should not
    Given   I am joining a team subscription
    And     Data obfuscation is on
    And     Only [Mask Credit Card Numbers] checklist is checked
    When    I post question and my attached file contains CCN and SSN
    Then    CCN should be replaced with "Hidden value" in my document preview
    And     CCN should be replaced with "Hidden value" in bidder's document preview
    And     CCN should be replaced with "Hidden value" in explainer's document preview
    And     The other data is preserved in my document preview
    And     The other data is preserved in bidder's document preview
    And     The other data is preserved in explainer's document preview

    # C29199
  Scenario: If data obfuscation is on, only [Mask Social Security Numbers] is checked and my file contains credit card number (CCN) and social security number (SSN) => SSN should be replaced with "Hidden value", CCN should not
    Given   I am joining a team subscription
    And     Data obfuscation is on
    And     Only [Mask Social Security Numbers] is checked
    When    I post question and my attached file contains Credit card number and Social security number
    Then    Social security numbers should be replaced with "Hidden value" in my document preview
    And     Social security numbers should be replaced with "Hidden value" in bidder's document preview
    And     Social security numbers should be replaced with "Hidden value" in explainer's document preview
    And     The other data is preserved in my document preview
    And     The other data is preserved in bidder's document preview
    And     The other data is preserved in explainer's document preview

    # C29717
  Scenario: If data obfuscation is on, both [Mask Credit Card Numbers] and [Mask Social Security Numbers] are checked and my file contains credit card number (CCN) and social security number (SSN) => SSN and CCN should be replaced with "Hidden value"
    Given   I am joining a team subscription
    And     Data obfuscation is on
    And     [Mask Credit Card Numbers] and [Mask Social Security Numbers] are checked
    When    I post question and my attached file contains Credit card number and Social security number
    Then    SSN and CCN should be replaced with "Hidden value" in my document preview
    And     SSN and CCN should be replaced with "Hidden value" in bidder's document preview
    And     SSN and CCN should be replaced with "Hidden value" in explainer's document preview
    And     The other data is preserved in my document preview
    And     The other data is preserved in bidder's document preview
    And     The other data is preserved in explainer's document preview

    # C29718
  Scenario: If data obfuscation is off and my file contains credit card number (CCN) and social security number (SSN) => SSN and CCN should not be obfuscated
    Given I am joining a team subscription
    And   Data obfuscation is off
    When  I post question and my attached file contains Credit card number and Social security number
    Then  SSN and CCN should not be obfuscated in my document preview
    And   SSN and CCN should not be obfuscated in bidder's document preview
    And   SSN and CCN should not be obfuscated in explainer's document preview
    And   The other data is preserved in my document preview
    And   The other data is preserved in bidder's document preview
    And   The other data is preserved in explainer's document preview

    # C29200
  Scenario: If my file which contains obfuscated credit card numbers and non-obfuscated social security numbers, the auditor should see the obfuscated CCN and non-obfuscated SSN when auditing my session
    Given   I had a session done contains attached file
    And     The Credit card number in attached file was obfuscated
    When    Auditor audits this session
    Then    Auditor should see the obfuscated cell(s) displayed "Hidden value"
    And     Auditor should see the non-obfuscated SSN

    # C29201
  Scenario: If my file which contains obfuscated social security numbers (SSN) and non-obfuscated credit card numbers (CCN), the auditor should see the obfuscated SSN and non-obfuscated CCN when auditing my session
    Given I had a session done contains attached file
    And   The social security numbers in attached file were obfuscated
    When  Auditor audits this session
    Then  Auditor should see the obfuscated cell(s) displayed "Hidden value"
    And   Auditor should see the non-obfuscated CCN

    # C29721
  Scenario: If my file which contains both obfuscated social security numbers(SSN) and credit card numbers(CCN), the auditor should see the obfuscated SSN and CCN when auditing my session
    Given I had a session done contains attached file
    And   The social security numbers in attached file were obfuscated
    When  Auditor audits this session
    Then  Auditor should see the obfuscated cell(s) displayed "Hidden value"
    And   Auditor should not see any CCN
    And   Auditor should not see any SSN

    # C29722
  Scenario: If my file which contains both non-obfuscated social security numbers(SSN) and credit card numbers(CCN) => the auditor should not see any "hidden value" cell when auditing my session
    Given I had a session done contains attached file
    And   SSN in attached file were not obfuscated
    And   CCN in attached file were not obfuscated
    When  Auditor audits this session
    Then  Auditor should not see any "Hidden value" cell
    And   Auditor should see the CCN
    And   Auditor should see the SSN

    # C29202
  Scenario: Log the account, user, session and time of obfuscation
    Given I have a session done contains obfuscated file
    Then  My account, expert's account, my session id and time of obfuscation should add to database: table a, field b

    # C29253
  Scenario: If my session is audited by an auditor and data in this session is obfuscated. Expert shouldn't see the document preview at /performance/feedback
    Given I have done a session contains obfuscated file
    And   An auditor audited that session
    When  Expert goes to /performance/feedback
    And   Expert clicks on that audit session
    Then  The document shouldn't be previewed, the displayed copy is "Preview not available"

    # C29716
  Scenario: Asker goes to view obfuscated document after it's done at /My Sessions/session
    Given   I have done a session with attached file contains obfuscated data
    When    I go to /My sessions/session
    Then    I should see the un-obfuscated file in my [Document preview] area

    # optional
  Scenario: Asker goes to download document in the [Chat with an Expert] area
    Given I have done a session contains obfuscated file
    When  I go to /My sessions/session
    And   I click download document button in the [Chat with an Expert] area
    Then  The downloaded document should be the original one