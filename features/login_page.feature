Feature: Allow users to login 
  As a participant
  So that I can log in my account
  I want to fill out the username and password

Background: Users have been added to the database
  
  Given the following users exist:
  | account_name    | password | first_name | last_name | organization | email           | phone      | mentor | mentee| organizer| 
  | mentor1         | password | mentor1    | mentor1   | Texas A&M    |mentor1@tamu.edu | 1234567890 | 1      | 0     |          |
  | mentor2         | password | mentor2    | mentor2   | Texas A&M    |mentor2@tamu.edu | 1234567890 | 1      | 0     |          |
  | mentee1         | password | mentee1    | mentee1   | Texas A&M    |mentee1@tamu.edu | 1234567890 | 0      | 1     |          | 
  | organizer       | organizer| organizer  | organizer | Texas A&M    |organizer@tamu.edu|1234567890 | 0      | 1     |1         |
  And I am on the CALM home page
  When I click on the "Login" button
  Then I should be on the user login page
  And 4 seed users should exist

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
  
Scenario: Existing user login successful and logout successful
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
  
Scenario: check my account button redirect successful for regular user and able to edit their info
  Given I am on the user login page
  Then I fill in "Email" with "mentor1@tamu.edu"
  And I fill in "Password" with "password"
  When I press "Log in"
  Then I should see "Login successful"
  And I am on the CALM home page
  And I should see "My account"
  And I should see "mentor1@tamu.edu"
  When I click on the "My account" button
  Then I am on the user account page for "mentor1@tamu.edu"
  And the "Email" field should contain "mentor1@tamu.edu"
  And the "User Name" field should contain "mentor1"
  Then I fill in "University/ Company" with "Blinn"
  When I press "Update" 
  Then I should see "User information was successfully updated."
  And the "University/ Company" field should contain "Blinn"
  When I click on the "Cancel" button 
  Then I am on the CALM home page
  
Scenario: check my account 
  Given I am on the user login page
  Then I fill in "Email" with "mentor1@tamu.edu"
  And I fill in "Password" with "password"
  When I press "Log in"
  Then I should see "Login successful"
  And I am on the CALM home page
  And I should see "My account"
  And I should see "mentor1@tamu.edu"
  When I click on the "My account" button
  Then I am on the user account page for "mentor1@tamu.edu"
  And the "Email" field should contain "mentor1@tamu.edu"
  And the "User Name" field should contain "mentor1"

#check if user if logged in as regular user SAD PATH
# they have no permission to creat/edit annoucement and events
Scenario: Regular user try to creat/edit annoucement and events
  Given I am on the user login page
  Then I fill in "Email" with "mentor1@tamu.edu"
  And I fill in "Password" with "password"
  When I press "Log in"
  Then I should see "Login successful"
  And I should not see "Add Announcement"
  And I should not see "Add Event"
  And I should not see "Edit"

# check if user is logged in as organizer
# so they have persmission to creat/edit annoucement and events
Scenario: Organizer to creat/edit annoucement
  Given I am on the user login page
  Then I fill in "Email" with "organizer@tamu.edu"
  And I fill in "Password" with "organizer"
  When I press "Log in"
  Then I should see "Login successful"
  And I should see "Add Announcement"
  And I should see "Add Event"
  
  # see if user can post annoucement 
  When I click on the "Add Announcement" button
  Then I should see "Post an Announcement"
  And I should see "Title"
  And I should see "Author"
  And I should see "Content"
  
  # if user will be directed back to homepage after submit add announcements 
  When I click on the "Cancel" button 
  Then I am on the CALM home page
  
  When I click on the "Add Announcement" button
  Then I fill in "Title" with "Testing"
  When I press "Save Changes"
  Then I am on the CALM home page
  And I should see "Testing"
  
  # check if uer can edit the annoucement
  # we don't know which edit button this line actually going into
  When I click on the "Edit" button
  Then I should see "Edit Existing Announcement"
  And the "Title" field should contain "Testing"
  
  When I click on the "Delete" button
  Then I should see "Announcement 'Testing' deleted."
  And I am on the CALM home page
  And I should not see "Testing"
  
Scenario: Check if user is organizer and create/edit event
  Given I am on the user login page
  Then I fill in "Email" with "organizer@tamu.edu"
  And I fill in "Password" with "organizer"
  When I press "Log in"
  Then I should see "Login successful"
  And I should see "Add Announcement"
  And I should see "Add Event"
  
  #check adding events
  When I click on the "Add Event" button
  Then I should see "Post an Event"
  And I should see "Conference"
  And I should see "Location"
  
  When I click on the "Cancel" button 
  Then I am on the CALM home page
  
  When I click on the "Add Event" button
  When I fill in "Conference" with "Event Test"
  And I fill in "Location" with "CS"
  When I press "Save Changes"
  Then I should see "was successfully created."
  And I am on the CALM home page
  And I should see "Event Test"
  And I should see "CS"
  
  # check editing events
  When I click on the "Edit" button 
  Then I should see "Edit Existing Event"
  And I should see "Name"
  And I should see "Location"
  And the "Name" field should contain "Event Test"
  When I press "Update Event Info"
  Then I should see "was successfully updated."
  # delete events
  When I click on the "Delete" button
  Then I should see "deleted."
  And I am on the CALM home page

Scenario: tryint to edit a random event
  Given I am on the user login page
  Then I fill in "Email" with "mentor1@tamu.edu"
  And I fill in "Password" with "password"
  When I press "Log in"
  Then I should see "Login successful"
  
  # Given I am on the edit event page for "ISCA"
  # Then the "Name" field should contain "ISCA"
  
  
  
  
  