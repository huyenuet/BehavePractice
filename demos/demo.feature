# Created by gotitinc at 7/10/18
Feature: as a [role],

  # text
  @scenario1 @tag2 @tag3
  Scenario: some scenario
    Given a sample text loaded into the frobulator
     """
     step 1: given
     """
    When we activate the frobulator
    """
    step 2: when
    """
    Then we will find it similar to English
    """
    step 3: then
    """

  # table
  @scenario2
  Scenario: some scenario
    Given a set of specific users
      | name      | department  |
      | Barry     | Beer Cans   |
      | Pudey     | Silly Walks |
      | Two-Lumps | Silly Walks |


  # step parameters
  @tag
  Scenario: step parameters demo
    Given I enter "google" into search box
