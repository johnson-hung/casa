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

Scenario: No information entered
  Given I am on the user Signup page
  When I press "Submit"
  Then I should not see "Successfully created account"
  Then I should see "Password can't be blank"
  Then I should see "Account name can't be blank"
  Then I should see "First name can't be blank"
  Then I should see "Last name can't be blank"

Scenario: Signup error due to lack of information 
  When I fill in "First Name" with "John"
  And I fill in "Last Name" with "John"
  When I check "mentor" 
  And I press "Submit"
  Then I should see "Password can't be blank"
  And I should see "Email can't be blank"

Scenario: Signup error due to wrong password confirmation
  When I fill in "First Name" with "john"
  And I fill in "Last Name" with "john"
  And I fill in "User Name" with "john"
  And I fill in "Password" with "1234"
  And I fill in "Password Confirmation" with "4321"
  And I fill in "Email" with "john@tamu.edu"
  When I check "mentee" 
  And I press "Submit"
  Then I should see "Password confirmation doesn't match Password"
  
Scenario: Signup error due to accout name already exist
  When I fill in "First Name" with "mentee1"
  And I fill in "Last Name" with "mentee1"
  And I fill in "User Name" with "mentee1"
  And I fill in "Password" with "1234"
  And I fill in "Password Confirmation" with "1234"
  And I fill in "Email" with "mentee1@tamu.edu"
  And I press "Submit"
  Then I should see "Account name has already been taken"

Scenario: creat accnout successful
  When I fill in "First Name" with "john"
  And I fill in "Last Name" with "john"
  And I fill in "User Name" with "john"
  And I fill in "Password" with "1234"
  And I fill in "Password Confirmation" with "1234"
  And I fill in "Email" with "john@tamu.edu"
  When I check "mentee" 
  And I press "Submit"
  Then I should see "Successfully created account"
  And I should not see "Log out"
  And I should see "Login"
  
  
