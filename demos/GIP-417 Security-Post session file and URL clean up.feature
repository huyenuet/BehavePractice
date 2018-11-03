# Created by gotitinc at 7/17/18
Feature: As an asker, I want all copies of my file is not public or float surrounding online collaboration tools
  As admins, we should not leave copies of the file in online collaboration tools (GSheets or One Drive) after a session ends.
  All data/URL associated with the file that are not in S3 should be removed.

  As soon as a session ends, we need to wipe out all content that are hosted on the
  collaboration tool (aka Gsheets/one drive)

  1. Clean up (aka delete/erase) the content of files and files themselves in the collaboration tool hosted by either MS online or Google.
  2. If immediate file level clean up is not available, consider wiping out all content in the file
  3. Disable the public URL pointing to the online files
  4. Wipe out the URL stored in the Got It database.

  Scenario: [MicroSoft collaboration tool] Expert clicks [Done] and asker clicks [End session] => delete all content of files and files themselves
    Given Asker and expert are connecting in a session
    When  Expert clicks [Done]
    And   Asker clicks [End session]
    Then  Content of the shared files between asker and expert in MicroSoft tool should be wiped out
    And   The files in MicroSoft tool should be removed themselves
    And   The URL should be removed from database: table a, field b

  Scenario: [Google collaboration tool] Expert clicks [Done] and asker clicks [End session] => delete all content of files and files themselves
    Given Asker and expert are connecting in a session
    When  Expert clicks [Done]
    And   Asker clicks [End session]
    Then  Content of the shared files between asker and expert in Google tool should be wiped out
    And   The files in Google tool should be removed themselves
    And   The URL should be removed from database: table a, field b

  Scenario: [MicroSoft collaboration tool] Expert clicks [Done] and asker doesn't click [End session] => When timeout, delete all content of files and files themselves
    Given Asker and expert are connecting in a session
    When  Expert clicks [Done]
    And   Asker doesn't click [End session] and timeout
    Then  Content of the shared files between asker and expert in MicroSoft tool should be wiped out
    And   The files in MicroSoft tool should be removed themselves
    And   The URL should be removed from database: table a, field b

  Scenario: [Google collaboration tool] Expert clicks [Done] and asker doesn't click [End session] => When timeout, delete all content of files and files themselves
    Given Asker and expert are connecting in a session
    When  Expert clicks [Done]
    And   Asker doesn't click [End session] and timeout
    Then  Content of the shared files between asker and expert in Google tool should be wiped out
    And   The files in Google tool should be removed themselves
    And   The URL should be removed from database: table a, field b

  Scenario: [MicroSoft collaboration tool] Expert doesn't click [Done] til timeout => When timeout, delete all content of files and files themselves
    Given Asker and expert are connecting in a session
    When  Expert doesn't click [Done] til maximum time of session runs out
    Then  Content of the shared files between asker and expert in MicroSoft tool should be wiped out
    And   The files in MicroSoft tool should be removed themselves
    And   The URL should be removed from database: table a, field b

  Scenario: [Google collaboration tool] Question is unanswered => When timeout, delete all content of files and files themselves
    Given Asker and expert are connecting in a session
    When  Expert doesn't click [Done] til maximum time of session runs out
    Then  Content of the shared files between asker and expert in Google tool should be wiped out
    And   The files in Google tool should be removed themselves
    And   The URL should be removed from database: table a, field b

  Scenario: [MicroSoft collaboration tool] Question is failed => delete all content of files and files themselves
    Given Question is routing
    When  No expert claims questions and timeout
    Then  Content of the shared files between asker and expert in MicroSoft tool should be wiped out
    And   The files in MicroSoft tool should be removed themselves
    And   The URL should be removed from database: table a, field b

  Scenario: [Google collaboration tool] Question is failed => delete all content of files and files themselves
    Given Question is routing
    When  No expert claims questions and timeout
    Then  Content of the shared files between asker and expert in Google tool should be wiped out
    And   The files in Google tool should be removed themselves
    And   The URL should be removed from database: table a, field b

  Scenario: [MicroSoft collaboration tool] File can not be deleted immediately => all content of file should be wiped out
    Given Asker and expert are connecting in a session
    When  Session ends
    And   File can not be deleted immediately (file level clean up is not available)
    Then  All content of file should be wiped out
    And   The URL should be removed from database: table a, field b
    And   The files in MicroSoft tool should be removed themselves

  Scenario: [Google collaboration tool] File can not be deleted immediately => all content of file should be wiped out
    Given Asker and expert are connecting in a session
    When  Session ends
    And   File can not be deleted immediately (file level clean up is not available)
    Then  All content of file should be wiped out
    And   The URL should be removed from database: table a, field b
    And   The files in Google tool should be removed themselves