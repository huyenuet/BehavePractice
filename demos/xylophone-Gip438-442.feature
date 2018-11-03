# Created by gotitinc at 8/7/18

  """
  GIP 438:
  """
Feature: As a Got It Admin, I want the ability to select which Experts are qualified to become Mentors.
  As a Got It Mentor, I want to be routed mentoring sessions.

  Scenario: As an admin, I can enable/disable mentoring subject for each expert
    Given   I am logged in as an admin
    When    I enable mentoring subject of expert whose id is xxx
    Then    This expert should become a mentor
    And     This expert should be routed to mentoring session
    When    I disable mentoring subject
    Then    This expert should not be routed to mentoring session

  Scenario: Mentoring subject is exempt from any surge scheduling form
    Given   Current status of system is Surge
    When    An expert is granted for a mentoring session
    And     Session ends
    Then    Expert should earn credits exactly equal to fixed credits
    And     In Earning/History, the Multiplier for mentoring session should always be 1.0

  Scenario: Mentee role just apply to new experts after Mentoring program is launched
    Given   Mentoring program is launched
    And     I create new expert account
    When    I pass the on-boarding test
    And     I go through all 8 orientation pages then click "Done" at the 8th page
    Then    I should be triggered to Mentoring introduction CTA model

  # add mixpanel event to track date of passing mentoring program
  Scenario:  New property in expert mixpanel profile to track the date of passing mentoring program
    Given   I am a mentee
    When    I pass the mentoring program the first time
    Then    My profile on Mixpanel should have property for time passing the mentoring program

  Scenario: Only the first time passing the mentoring program should be save at mixpanel
    Given   I passed the mentoring program
    When    Admin removes my mentoring subject
    Then    I should have to take mentoring program again
    When    I pass mentoring program the second times
    Then    Time passing mentoring program property on mixpanel doesn't change

"""
GIP 442: mentoring session in admin panel view
"""

  Background: I am an admin
    Given I log in as an admin

# mentoring session on Session page

  Scenario: [Check UI] Display 1 new tab "Mentoring" for mentoring sessions on Session page
    Given   I am at Session page
    Then    I should see 1 new tab "Mentoring" next to "Sessions" tab
    When    I click on a normal session
    Then    I should see url /problems/normal/[problem-id]
    When    I click on "Mentoring" tab
    Then    I should see a table show all mentoring sessions
    When    I click on a mentoring session
    Then    I should see url /problems/mentoring/[problem-id]

  Scenario: [Session/mentoring tab][Check UI] all mentoring sessions should only show in mentoring session tab
    Given   I am viewing a mentor's profile
    And     That mentor has more than 0 mentoring session
    When    I click on explanation session tab
    Then    Mentoring sessions should not appear here
    When    I click on mentoring session tab
    Then    I should see all the mentoring sessions of that expert

  Scenario: [Check UI][Session/mentoring tab] Check all the fields of search form
    Given   I am at Session page/ mentoring tab
    Then    I should see search form includes: Mentee ID, Mentor ID, Problem ID, Status, Rating .. (need to update after dev)
    And     Ask Date, Status, Rating fields should be filterable

  Scenario: [Check UI][Session/mentoring tab] Check all the fields of mentoring session table
    Given   I am at Session page/ mentoring tab
    Then    Session table should include: ID, Ask Date, Question, Type, Mentee, Mentor, Status, Rating, Claim time, Session time
    And     These value should match with database, table [abc] (now is problem)

    # Mentoring session search form
  Scenario: [Mentoring session search form] input a correct mentee ID, click search => should show only sessions stick with this mentee ID
    Given   I am at Session page/ mentoring tab
    When    I input a correct mentee ID
    And     I click "Search" button
    Then    I should see a list of mentoring sessions stick with this mentee ID

  Scenario: [Mentoring session search form] input a wrong mentee ID, click search => should not show any sessions
    Given   I am at Session page/ mentoring tab
    When    I input a wrong mentee ID
    And     I click "Search" button
    Then    I should not see any sessions

  Scenario: [Mentoring session search form] input a correct mentor ID, click search => should show only sessions stick with this mentor ID
    Given   I am at Session page/ mentoring tab
    When    I input a correct mentor ID
    And     I click "Search" button
    Then    I should see a list of mentoring sessions stick with this mentor ID

  Scenario: [Mentoring session search form] input a wrong mentor ID, click search => should not show any sessions
    Given   I am at Session page/ mentoring tab
    When    I input a wrong mentor ID
    And     I click "Search" button
    Then    I should not see any sessions

  Scenario: [Mentoring session search form] input a correct session ID, click search => should show only sessions stick with this session ID
    Given   I am at Session page/ mentoring tab
    When    I input a correct session ID
    And     I click "Search" button
    Then    I should see a list of mentoring sessions stick with this session ID

  Scenario: [Mentoring session search form] input a wrong session ID, click search => should not show any sessions
    Given   I am at Session page/ mentoring tab
    When    I input a wrong session ID
    And     I click "Search" button
    Then    I should not see any sessions

  Scenario: [Mentoring session search form] input an ask date, click search => should show only sessions created on that date
    Given   I am at Session page/ mentoring tab
    When    I select a date in search form
    And     I click "Search" button
    Then    I should see a list of mentoring sessions created on that date

  Scenario: [Mentoring session search form] input an status, click search => should show only sessions having that status
    Given   I am at Session page/ mentoring tab
    When    I select a status in search form
    And     I click "Search" button
    Then    I should see a list of mentoring sessions having that status

  Scenario: [Mentoring session search form] input a rating value, click search => should show only sessions having the same rate
    Given   I am at Session page/ mentoring tab
    When    I select a rating value
    And     I click "Search" button
    Then    I should see a list of mentoring sessions having the same rate


  # Mentoring session search form / Multi-entry searchable
  Scenario: [Mentoring session search form][Multi-entry searchable] input multi correct mentee IDs, click search => should show only sessions stick with these mentee IDs
    Given   I am at Session page/ mentoring tab
    When    I input multi correct mentee IDs
    And     I click "Search" button
    Then    I should see a list of mentoring sessions stick with these mentee IDs

  Scenario: [Mentoring session search form][Multi-entry searchable] input multi correct mentor IDs, click search => should show only sessions stick with these mentor IDs
    Given   I am at Session page/ mentoring tab
    When    I input multi correct mentor IDs
    And     I click "Search" button
    Then    I should see a list of mentoring sessions stick with these mentor IDs

  Scenario: [Mentoring session search form][Multi-entry searchable] input multi correct session IDs, click search => should show only sessions stick with these session IDs
    Given   I am at Session page/ mentoring tab
    When    I input multi correct session IDs
    And     I click "Search" button
    Then    I should see a list of mentoring sessions stick with these session IDs


  # expert's profile: mentoring session detail
  Scenario: [Expert's profile/Mentoring session detail] When click on question's description in expert/mentoring session tab => redirect to /problems/[problem-id] to view question's detail
    Given   I log in as an admin
    And     I am viewing a mentor's profile
    And     That mentor has more than 0 mentoring session
    When    I click on mentoring session tab
    And     I click on question's description
    Then    I should be navigated to /problems/mentoring/[problem-id]

  # mentoring sessions on whoever (who conduct at least one mentoring session) profile
  Scenario: [Check UI] Display 1 new tab for mentoring session on expert's profile call "Mentoring"
    Given   Expert X have at least one mentoring session
    When    I click on that expert's ID to view profile
    Then    I should see new tab for mentoring session call "Mentoring"

  Scenario: [Check UI] Hide Mentoring tab if expert does not conduct any mentoring sessions
    Given   Expert X does not conduct any mentoring sessions
    When    I click on that expert's ID to view profile
    Then    I should not see any tab call "Mentoring"

  Scenario: [Mentor session data] Check following data points for a mentoring session at admin panel: Question, Type, Rating, Claim time, Session time
    Given   I am at admin/session/mentoring session
    Then    Question should always be "This is a Mentoring Session"
    And     Type should always be "Mentoring"
    And     Rating should be star rating from Mentor
    And     Claim time should be time taken from time of route to time of claim for the Mentor who claimed the problem
    And     Session time should be time taken to complete a mentoring session

  Scenario: [Session/Mentoring session] Click mentoring question => show right hand panel with the chat transcript
    Given   I am at session/mentoring session tab
    When    I click "This is a Mentoring Session"
    Then    I should see a right hand panel with the chat transcript shows up
    And     I should see url like /problems/[problem-id]

  Scenario: [Check UI] All mentoring sessions should only appear in mentoring session tab
    Given   I am viewing a mentor's profile
    And     That mentor has more than 0 mentoring session
    When    I click on explanation session tab
    Then    Mentoring sessions should not show here
    When    I click on mentoring session tab
    Then    I should see all the mentoring sessions of that expert

  Scenario: When click on mentee's ID in mentoring session tab => redirect to view mentee's profile
    Given   I am viewing a mentor's profile
    And     That mentor has more than 0 mentoring session
    When    I click on mentoring session tab
    And     I click on mentee's id
    Then    I should be navigated to user/experts/[expert-id]

  # mentor profile
  Scenario: Click on mentor's ID in mentoring session tab => redirect to view mentor's profile
    Given   I am viewing a mentor's profile
    And     That mentor has more than 0 mentoring session
    When    I click on mentoring session tab
    And     I click on mentor's id
    Then    I should be navigated to user/experts/[expert-id]

  Scenario: [Check UI] In "Performance" column, there is a row "Mentorings" to display total number of mentoring problems
    Given   I am viewing a mentor's profile
    Then    I see "Mentorings" row in `Performance` column
    And     The value of "Mentorings" is total number of mentoring problems that expert had


  # mentee profile
  Scenario: [Check UI] "Reset test counter" button for resetting number of mentoring session attempts is added in mentee's profile
    Given   I am viewing a mentee's profile
    Then    I should see a button in "Actions" column for resetting number of mentoring session attempts

  Scenario: [Check UI] No New button for resetting number of mentoring session attempts in non-mentee's profile
    Given   I am viewing a non-mentee's profile
    Then    I should not see a button in "Actions" column for resetting number of mentoring session attempts

  Scenario: [Check UI] New row "number of resets" in `Performance` column in mentee's profile. This row display total number of mentoring program reset times
    Given   I am viewing a mentee's profile
    Then    I should see a "number of resets" row in "Performance"
    And     Value of this row is total number of mentoring program reset times

  Scenario: Admin can reset number of mentoring session attempts
    Given   I am viewing a mentee's profile
    And     Mentee failed all mentoring session attempts
    When    I click reset mentoring session attempts
    Then    Mentee can reattempt mentoring session

  Scenario: [Bypass mentee][Check UI] New button for admin to bypass mentee over mentoring program
    Given   I am viewing a mentee's profile
    Then    I should see new button at "Actions" column to bypass mentee over mentoring program

  Scenario: [Bypass mentee] Admin click by pass mentoring program => mentee should be passed mentoring program and become normal expert
    Given   I am viewing a mentee's profile
    And     This mentee is logged in at excelchat.co
    And     This mentee is seeing "start mentoring program" button
    When    I click by pass mentoring program for that mentee
    Then    Mentee should see 'pass' modal
    When    Memtee click CTAs button on modal
    Then    This mentee should see "start mentoring program" button replaced by "Start working" button at homepage

  # user/ expert / search bar
  Scenario: [Check UI] At user/expert on admin panel -> Add new Search field call "Role" which should be filterable (mentee/mentor)
    Given   I am at user/expert
    Then    I should see new search field call "Role"
    And     Role field should be filterable

  Scenario: At user/expert, I select "Mentor" option in "Role" field then click search => results should be mentors only
    Given   I am at user/expert
    When    I choose "mentor" option in "Role" field
    And     I click search button
    Then    I should see only mentor in the results

  Scenario: At user/expert, I select "Mentor" option in "Role" field then click search => results should be mentors only
    Given   I am at user/expert
    When    I choose "mentee" option in "Role" field
    And     I click search button
    Then    I should see only mentee in the results

  # new: admin can on/off the mentoring program. check at the time expert pass first subject test, current attempt is 1
  Scenario: [Turns on mentor program] expert is at on-boarding test => expert see mentoring program after finish
    Given   Mentor program is off
    And     Expert X is at on-boarding test
    When    I turn on mentor program
    And     Expert X passes on-boarding test
    Then    Expert should see triggered mentoring session

  Scenario: [Turns on mentor program] expert fails mentoring program and has at least 1 attempts left => can see and access to mentoring program after refresh
    Given   Mentor program is off
    And     Expert fails mentoring program
    And     Expert has at least 1 attempts left to do mentoring program
    And     Expert is not working in a chat session
    When    I turn on mentor program
    And     Expert refreshes page
    And     Expert goes to /home
    Then    Expert should see button "start your mentoring session"
    When    Expert clicks on "start your mentoring session" button
    Then    Expert should be connected to a mentoring session

  Scenario: [Turns on mentor program] expert fails mentoring program and has no attempts left => could not access to mentoring program after refresh
    Given   Mentor program is off
    And     Expert fails mentoring program
    And     Expert has no attempts left to do mentoring program
    And     Expert is not working in a chat session
    When    I turn on mentor program
    And     Expert refreshes page
    And     Expert goes to /home
    Then    Button "start your mentoring session" should be disabled
    And     Copy for button should be like "you have to pass mentoring session"

  Scenario: [Turns on mentor program] expert passed mentoring program => will not see mentoring program after refresh
    Given   Mentor program is off
    And     Expert passed mentoring program
    And     Expert is not working in a chat session
    When    I turn on mentor program
    And     Expert refreshes page
    And     Expert goes to /home
    Then    Button "Start working" should be there

  # new: check role of mentee if mentor program is on/off
  Scenario: New expert passes subject test the first time & mentoring program is on => this expert should be assigned as mentee role

  # new: mentoring session can be terminated by admin
  Scenario: [Terminate mentoring session] Admin terminates mentoring session => both mentee and mentor are kicked out of session and see message popup
    Given   Mentee and mentor are connecting in a session
    And     I am at Session page
    When    I click terminate that session
    Then    That session's status should be Terminated
    And     That session should be ended
    And     Mentee should see terminated modal
    And     Mentor should see terminated modal
    When    Mentee clicks on [OK] button
    Then    Mentee should be redirected to /my sessions
    When    Mentor clicks on [OK] button
    Then    Mentor should be redirected to home


  #new: minimum 2 stars to pass mentoring program
  # new : We do not allow admin to set subject `Mentoring` for a Mentee. Mentoring checkbox will be disabled.