Feature: Record user information
  As a participant
  So I can create a user account
  I want to fill out the personal information 

Background: Users have been added to the database
  
  Given the following users exist:
  | account_name    | password | first_name | last_name | organization | email           | phone      | mentor | mentee| 
  | mentor1         | password | mentor1    | mentor1   | Texas A&M    |mentor1@tamu.edu | 1234567890 | 1      | 0     |
  | mentor2         | password | mentor2    | mentor2   | Texas A&M    |mentor2@tamu.edu | 1234567890 | 1      | 0     |
  | mentee1         | password | mentee1    | mentee1   | Texas A&M    |mentee1@tamu.edu | 1234567890 | 0      | 1     |
  And I am on the CALM home page
  When I click on the "Signup" button
  Then I should be on the user Signup page
  And 3 seed users should exist

Scenario: see an sign up information
  Given I am on the user Signup page
  Then I should see "User Sign Up"
