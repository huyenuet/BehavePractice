# Created by gotitinc at 7/18/18
Feature: #Enter feature name here
  # Enter feature description here

  Background: I am an existing expert
    Given I am an existing expert

  Scenario: Successful login with email
    Given   I am not logged in the app
    When    I open the app
    Then    I should be redirected to Login page
    When    I enter correct email and correct password
    And     I click [Log in] button
    Then    I should be redirected to the Home - Current Volume page

  Scenario: Successful login with Facebook
    Given   I am at the Login page
    When    I click on [Login with Facebook] button
    And     I successfully authenticate with Facebook account
    Then    I should be redirected to the Home - Current Volume page

  Scenario: Unsuccessful login with non-registered email
    Given   I am at the Login page
    When    I enter non-registered email and password
    And     I click [Log in] button
    Then    I should see the error message "The account you've entered doesn't exist"

  Scenario: Unsuccessful login with incorrect password
    Given   I am at the Login page
    When    I enter registered email and incorrect password
    And     I click [Log in] button
    Then    I should see the error message "incorrect email or password"

  Scenario: Unsuccessful login with Facebook
    Given   I am at the Login page
    When    I click on [Login with Facebook] button
    And     I unsuccessfully authenticate with Facebook account
    Then    I should see the error message

  Scenario: [Login fail] Expert who has not passed 1 subject test can not log in
    Given   I am an expert who has not passed any subjects
    And     I am at the Login page
    When    I enter correct email and correct password
    And     I click [Log in] button
    Then    I should be redirected to the Login fail page
    And     The copy displayed should be "Take action!"

  Scenario: [Login to banned account] Expert who was banned by admin can not log in
    Given   I am an expert who was banned by admin
    And     I am at the Login page
    When    I enter correct email and correct password
    And     I click [Log in] button
    Then    I should be redirected to the Login banned page
    And     The copy displayed should be "You've been blocked"

  Scenario: [Forgot password] Reset password successfully
    Given   I am at the Login page
    When    I click on [forgot your password] link
    Then    I should be navigated to Forgot password page
    When    I enter registered email
    And     I click [Reset password] button
    Then    I should receive an reset password email in my email's inbox
    When    I click on [reset password] button in that email
    Then    I should logged in successfully
    And     I should see the New password popup
    When    I enter a new valid password
    Then    I should be redirected to the Home - Current Volume page
    And     My password is changed successfully

  Scenario: Expert should be redirected to Log in page if click on "cancel" on Forgot password page

  Scenario: Automatically display fail screen if all subjects of expert are decertified by admin
    Given   I am logged in the app
    When    Admin decertifies all my subject(s)
    Then    I should see the "Take action!" screen

  Scenario: [Auto logout] Automatically log an Expert out if the expert is banned by admin
    Given   I am logged in the app
    When    Admin bans my account
    Then    I should be auto logged out the app

  Scenario: [First login] Trigger phone notifications settings to ask for push notifications permissions
    Given   I log in the app the first time
    Then    I should see the trigger phone notifications settings which ask for push notifications permissions

  Scenario: [First login] Timezone should be same with expert portal on browser
    Given   I log in the app the first time
    Then    I should see the timezone is same with my timezone on browser expert portal

  Scenario: [Keep expert logging in] Keep expert logged into the app unless (s)he logs out
    Given   I am logged in the app
    When    I close the app
    And     I open it later
    Then    I should be redirected to the page where I left the last time

  Scenario: [Log in after killing the app] Expert should be navigated to Home Page - Current Volume after killing and relaunch the app
    Given   I am logged in the app
    When    I kill the app
    And     I open it later
    Then    I should be redirected to the Home - Current Volume page