Feature: Allow users to login 
  As a participant
  So that I can log in my account
  I want to fill out the username and password

Background: Users have been added to the database
  
  Given the following users exist:
  | account_name    | password | first_name | last_name | organization | email           | phone      | mentor | mentee| 
  | mentor1         | password | mentor1    | mentor1   | Texas A&M    |mentor1@tamu.edu | 1234567890 | 1      | 0     |
  | mentor2         | password | mentor2    | mentor2   | Texas A&M    |mentor2@tamu.edu | 1234567890 | 1      | 0     |
  | mentee1         | password | mentee1    | mentee1   | Texas A&M    |mentee1@tamu.edu | 1234567890 | 0      | 1     |
  And I am on the CALM home page
  When I click on the "Login" button
  Then I should be on the user login page
  And 3 seed users should exist

Scenario: Being able to see the login fileds
  Given I am on the user login page
  Then I should see "Email"
  And I should see "Password"

Scenario: None existing user trying to login
  Given I am on the user login page
  Then I fill in "Email" with "test@tamu.edu"
  And I fill in "Password" with "dontwork"
  When I press "Log in"
  Then I should not see "Login successful"
  And I should see "Invalid user/password combination"

Scenario: Existing user login successful
  Given I am on the user login page
  Then I fill in "Email" with "mentor1@tamu.edu"
  And I fill in "Password" with "password"
  When I press "Log in"
  Then I should see "Login successful"

Scenario: Existing user login failed due to wrong combination
  When I fill in "Email" with "mentor1@tamu.edu"
  And I fill in "Password" with "whati$pass"
  When I press "Log in"
  Then I should see "Invalid user/password combination"
  
Scenario: Existing user login successful and redirect successful
  Given I am on the user login page
  Then I fill in "Email" with "mentor1@tamu.edu"
  And I fill in "Password" with "password"
  When I press "Log in"
  Then I should see "Login successful"
  And I should see "mentor1@tamu.edu"
  And I should see "Log out"
  When I click on the "Log out" button
  Then I should see "Successfully logged out"
  And I should not see "Log out"
  And I should see "Login"