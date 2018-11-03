# Created by gotitinc at 8/9/18

  """
  Comment section
  """

Feature: As a visitor or a user, I can post comment at the SEO page
  and post question after post comment successfully

  Background: I am at the url test
    Given   I am at the url test page

  Scenario: [Check UI][Comment section][User is logged in] comment form includes show email, name, comment box with submit button at the comment section
    Given   I am logged in
    When    I scroll to the comment section
    Then    I should see comment section which includes email, name, comment box and "post a comment" button

  Scenario: [Check UI][Comment section][User is not logged in] comment form includes show email, name, comment box with submit button at the comment section
    Given   I am not logged in
    When    I scroll to the comment section
    Then    I should see comment section which includes email, name, comment box and "post a comment" button

  Scenario: [Pending comment post][User is not logged in] Comment is not approved by admin => comment is not displayed in the comment list
    When    I input a comment
    And     I input a name
    And     I input a valid email
    And     I click "Post a comment" button
    Then    I should see a description ask form which is auto filled with my comment
    When    I close that description ask form
    Then    I should see message similar to "posted comment successfully and pending review from administrator"
    And     My comment should not show at the bottom of comment list
    And     At admin panel, my comment should have status "pending"

  Scenario: [Pending comment post][User is logged in] Comment is not approved by admin => comment is not displayed in the comment list
    Given   I am logged in
    When    I input a comment
    And     I input a name
    And     I input a valid email
    And     I click "Post a comment" button
    Then    I should see message similar to "posted comment successfully and pending review from administrator"
    And     My comment should not show at the bottom of comment list
    And     At admin panel, my comment should have status "pending"

  Scenario: [Approve comment post][User is not logged in] Comment is approved by admin => comment is displayed in the comment list
    Given   I am not logged in
    And     I post a comment successfully
    When    Admin approves my comment
    Then    My comment should show at the bottom of comment list

  Scenario: [Approve comment post][User is logged in] Comment is not approved by admin => comment is displayed in the comment list
    Given   I am logged in
    And     I post a comment successfully
    When    Admin approves my comment
    Then    My comment should show at the bottom of comment list

  Scenario: [Reject comment post][User is not logged in] Comment is rejected by admin => comment is not displayed in the comment list
    Given   I am not logged in
    And     I post a comment successfully
    When    Admin rejects my comment
    Then    My comment should not show at the bottom of comment list

  Scenario: [Reject comment post][User is logged in] Comment is not rejected by admin => comment is not displayed in the comment list
    Given   I am logged in
    And     I post a comment successfully
    When    Admin rejects my comment
    Then    My comment should not show at the bottom of comment list

  Scenario: [Post comment unsuccessfully][User is not logged in] Enter invalid email and click "post comment" button => show error message
    Given   I am not logged in
    When    I input a comment
    And     I input a name
    And     I input an invalid email
    And     I click "Post a comment" button
    Then    I should see an error message for invalid
    And     My comment should not be posted

  Scenario: [Post comment unsuccessfully][User is not logged in] Enter empty comment => show all field required error message
    Given   I am not logged in
    When    I input an empty comment
    And     I input a name
    And     I input an valid email
    And     I click "Post a comment" button
    Then    I should see a error message for field required
    And     My comment should not be posted

  Scenario: [Post comment unsuccessfully][User is not logged in] Enter empty name => show all field required error message
    Given   I am not logged in
    When    I input a comment
    And     I input an empty name
    And     I input an valid email
    And     I click "Post a comment" button
    Then    I should see a error message for field required
    And     My comment should not be posted

  Scenario: [Post comment unsuccessfully][User is not logged in] Enter empty email => show all field required error message
    Given   I am not logged in
    When    I input a comment
    And     I input a name
    And     I input an empty email
    And     I click "Post a comment" button
    Then    I should see a error message for field required
    And     My comment should not be posted

  Scenario: [Comment ask successfully][User never logged in before] Comment length is shorter 40 characters => should show description form after click "Post a comment"
    Given   I never logged in excelchat before
    And     I input comment, name, email on the comment post form
    And     My comment length is shorter 40
    And     My email is non-registered
    When    I click "post a comment"
    Then    I should see the description ask form
    And     Description box should be auto-filled with my comment from comment form
    When    I click "Try now for free" button
    Then    I should see the red mess warning about number of characters
    When    I fill description box with question which has length between 40 and 650
    And     I click "Try now for free" button
    Then    I should see the email input form
    And     Email box should be auto-filled with my email in comment form
    When    I click "Connect" button
    Then    I should see the terms and conditions popup
    When    I click "Next" button
    Then    I should be redirected to the excelchat.co/home
    And     My question should be posted
    And     I should see the matching animation model

  Scenario: [Comment ask successfully][User never logged in before] Comment length is between 40 and 650 characters => should show email input form after click "Post a comment"
    Given   I never logged in excelchat before
    And     I input comment, name, email on the comment post form
    And     My comment length is between 40 and 650
    And     My email is non-registered
    When    I click "post a comment"
    Then    I should see the email input form
    And     Email box should be auto-filled with my email in comment form
    When    I click "Connect" button
    Then    I should see the terms and conditions popup
    When    I click "Next" button
    Then    I should be redirected to the excelchat.co/home
    And     My question should be posted
    And     I should see the matching animation model

  Scenario: [Comment ask successfully][User never logged in before] Comment length is longer than 650 characters => should show description box after click "Post a comment"
    Given   I never logged in excelchat before
    And     I input comment, name, email on the comment post form
    And     My comment length is longer than 650
    And     My email is non-registered
    When    I click "post a comment"
    Then    I should see the description ask form
    And     Description box should be auto-filled with my comment from comment form
    When    I click "Try now for free" button
    Then    I should see the red mess warning about number of characters
    When    I fill description box with question which has length between 40 and 650
    And     I click "Try now for free" button
    Then    I should see the email input form
    And     Email box should be auto-filled with my email in comment form
    When    I click "Connect" button
    Then    I should see the terms and conditions popup
    When    I click "Next" button
    Then    I should be redirected to the excelchat.co/home
    And     My question should be posted
    And     I should see the matching animation model

  Scenario: [Comment ask successfully][User logged in before] Comment length is shorter than 40 => show description box, login form pops up after user submits that question
    Given   I logged in Excelchat by this browser before
    And     I am not logged in
    And     I input comment, name, valid email on the comment post form
    And     My comment length is shorter than 40
    When    I click "post a comment"
    Then    I should see the description ask form
    And     Description box should be auto-filled with my comment from comment form
    When    I click "Try now for free" button
    Then    I should see the red mess warning about number of characters
    When    I fill description box with question which has length between 40 and 650
    And     I click "Try now for free" button
    Then    I should see login popup
    When    I input my account: correct email and password
    And     I should be redirected to the excelchat.co/home
    And     My comment should be auto-filled in description box

*note: at comment post, don't check existed email
    existed email will be checked at ask flow

*backlog:

  Scenario: [Reply comment] reply to a comment successfully
    Given   I am at the url test
    When    I enter text to reply comment box
    And     I hit enter
    Then    My comment should be posted successfully

  Scenario: [Check UI][Reply to 1st level comment] Comment displays for 2 level
    Given   I am at the url test
    When    I reply to a existed 1st comment
    Then    My replied comment should be 2nd level comment
    And     My replied comment should be add to the bottom of the list of comments

  Scenario: [Check UI][Reply to n-th level comment] Comment keeps displaying for 2 level when I try to reply to n-th level comment
    Given   I am at the url test
    When    I reply to a non-1st level comment
    Then    My replied comment should be 2nd level comment