# Created by gotitinc at 9/28/18
Feature: Skip, flag flow on slack bot
  As an user, I want to know reasons if I can't post a question.

  # flag reason
  Scenario: [Flag] Users should see respective message if their question is flagged with reason 1
    Given   I post a question to Excelchat bot
    And     There is one routed expert for that question
    When    That expert flags my question with reason 1
    Then    My question should be failed
    And     My question should be failed
    And     I should see respective message sent by Excelchat bot
    
  Scenario: [Flag] Users should see respective message if their question is flagged with reason 2
    Given   I post a question to Excelchat bot
    And     There is one routed expert for that question
    When    That expert flags my question with reason 2
    Then    My question should be failed
    And     I should see respective message sent by Excelchat bot
    
  Scenario: [Flag] Users should see respective message if their question is flagged with reason 3
    Given   I post a question to Excelchat bot
    And     There is one routed expert for that question
    When    That expert flags my question with reason 3
    Then    My question should be failed
    And     I should see respective message sent by Excelchat bot
    
  Scenario: [Flag] Users should see respective message if their question is flagged with reason 4
    Given   I post a question to Excelchat bot
    And     There is one routed expert for that question
    When    That expert flags my question with reason 4
    Then    My question should be failed
    And     I should see respective message sent by Excelchat bot

  # 2 flags
  Scenario: [2 flags] Users' question should be failed if their question is flagged firstly by 2 experts
    Given   I post a question to Excelchat bot
    And     There is three routed expert for that question
    When    Two experts flag my question
    And     One expert does not make any action at bidding screen
    Then    My question should be failed
    And     I should see respective message sent by Excelchat bot

  # skip reason
  Scenario: [Skip] Users should see respective message if their question is skipped with reason 1
    Given   I post a question to Excelchat bot
    And     There is one routed expert for that question
    When    That expert skips my question with reason 1
    Then    My question should be failed
    And     I should see respective message sent by Excelchat bot

  Scenario: [Skip] Users should see respective message if their question is skipped with reason 2
    Given   I post a question to Excelchat bot
    And     There is one routed expert for that question
    When    That expert skips my question with reason 2
    Then    My question should be failed
    And     I should see respective message sent by Excelchat bot

  Scenario: [Skip] Users should see respective message if their question is skipped with reason 3
    Given   I post a question to Excelchat bot
    And     There is one routed expert for that question
    When    That expert skips my question with reason 3
    Then    My question should be failed
    And     I should see respective message sent by Excelchat bot

  Scenario: [Skip] Users should see respective message if their question is skipped with reason 4
    Given   I post a question to Excelchat bot
    And     There is one routed expert for that question
    When    That expert skips my question with reason 4
    Then    My question should be failed
    And     I should see respective message sent by Excelchat bot

  Scenario: [Skip] If question is skipped => Excelchat bot provide the phone number for customer service
    Given   My question is skipped by experts
    Then    My question should be failed
    And     I should see phone number for customer service sent by Excelchat bot
    
  # auto skip reason
  Scenario: [Autoskip] Users should see respective message if their question is auto skipped
    Given   I post a question to Excelchat bot
    And     There is one routed expert for that question
    When    That expert does no action at bidding screen
    Then    My question should be failed
    And     I should see respective message sent by Excelchat bot

  Scenario: [Autoskip] Users should see respective message if their question is skipped by expert clicking on 'Stop working' button
    Given   I post a question to Excelchat bot
    And     There is one routed expert for that question
    When    That expert clicks "Stop working" at bidding screen
    Then    My question should be failed
    And     I should see respective message sent by Excelchat bot

  # dead reason
  Scenario: [Dead] Users should see respective message if their question is dead
    Given   I post a question to Excelchat bot
    And     There is no experts routed for that question
    Then    My question should be failed
    And     I should see respective message sent by Excelchat bot


  # number of submission go first
  Scenario: 2 same skips then 1 flag -> display skip message
    Given   I post a question to Excelchat bot
    And     There is 3 experts routed for that question
    When    First expert skips question with reason 1
    And     Second expert skips question with reason 1
    And     Third expert flags question with whatever reason
    Then    My question should be failed
    And     I should see respective skip message sent by Excelchat bot

  Scenario: 1 skip then 2 same flags -> display flag message
    Given   I post a question to Excelchat bot
    And     There is 3 experts routed for that question
    When    First expert skips question with reason 1
    And     Second expert skips question with reason 1
    And     Third expert flags question with whatever reason
    Then    My question should be failed
    And     I should see respective flag message sent by Excelchat bot

  # check priority
  Scenario: 1 skip & 1 flag --> display reason for skip
    Given   I post a question to Excelchat bot
    And     There is 2 experts routed for that question
    When    First expert skips question with whatever reason
    And     Second expert flags question with whatever reason
    Then    My question should be failed
    And     I should see respective skip message sent by Excelchat bot

  Scenario: 1 skip & 1 autoskip --> display reason for skip
    Given   I post a question to Excelchat bot
    And     There is 2 experts routed for that question
    When    First expert skips question with whatever reason
    And     Second expert does no action at bidding screen
    Then    My question should be failed
    And     I should see respective skip message sent by Excelchat bot

  Scenario: 1 flag & 1 autoskip --> display reason for flag
    Given   I post a question to Excelchat bot
    And     There is 2 experts routed for that question
    When    First expert skips question with whatever reason
    And     Second expert does no action at bidding screen
    Then    My question should be failed
    And     I should see respective flag message sent by Excelchat bot

  Scenario: 2 different skips --> display reason for skip which has higher priority
    Given   I post a question to Excelchat bot
    And     There is 2 experts routed for that question
    When    First expert skips question with reason 1
    And     Second expert skips question with reason 2
    Then    My question should be failed
    And     I should see respective message for skip reason 1 sent by Excelchat bot

  Scenario: 2 different flags --> display reason for flag which has higher priority
    Given   I post a question to Excelchat bot
    And     There is 2 experts routed for that question
    When    First expert flags question with reason 1
    And     Second expert flags question with reason 2
    Then    My question should be failed
    And     I should see message respective with flag reason 1 sent by Excelchat bot


  # combination of "number of submission" (go first) and "reason priority" (go second)
  Scenario: 2 different skips then 1 flag -> display higher priority skip reason
    Given   I post a question to Excelchat bot
    And     There is 3 experts routed for that question
    When    First expert skips question with reason 1
    And     Second expert skips question with reason 2
    And     Third expert flags question with whatever reason
    Then    My question should be skipped
    And     I should see message respective with skip reason 1 sent by Excelchat bot