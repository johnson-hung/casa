Feature: display events on CALM homepage 

  As a participant 
  So that I can see the events that have not yet happened 
  I want to see the events through the home page view 

Background: events have been added to database

  Given the following events exist:
  | name       | location   | start_at    | end_at       |
  | ISCA       | New York   | 21-Jun-2000  | 21-Jun-2022  |
  | HPCA       | Denver     | 21-Jun-2001  | 21-Jun-2025  |
  | ASPLOS     | Seattle    | 21-Jun-2002  | 21-Jun-2032  |

  And the following users exist:
  | account_name    | password | first_name | last_name | organization | email           | phone      | mentor | mentee| organizer| 
  | mentor1         | password | mentor1    | mentor1   | Texas A&M    |mentor1@tamu.edu | 1234567890 | 1      | 0     |          |
  | mentor2         | password | mentor2    | mentor2   | Texas A&M    |mentor2@tamu.edu | 1234567890 | 1      | 0     |          |
  | mentee1         | password | mentee1    | mentee1   | Texas A&M    |mentee1@tamu.edu | 1234567890 | 0      | 1     |          | 
  | organizer       | organizer| organizer  | organizer | Texas A&M    |organizer@tamu.edu|1234567890 | 0      | 1     |1         |


  And I am on the CALM home page
  Then 3 seed events should exist

Scenario: see an event
  Given I am on the home page 
  Then I should see "Conference"
  And I should see "Location"
  And I should see "Starting Date"
  And I should see "ISCA"
  And I should see "New York"

#check for event signup information appeared in organizer account
Scenario: Check user event sign up information in organizer account
  Given I am on the user login page
  Then I fill in "Email" with "organizer@tamu.edu"
  And I fill in "Password" with "organizer"
  When I press "Log in"
  Then I should see "Login successful"
  And I should see "Add Announcement"
  And I should see "Add Event"
  
  When I am on the edit event page for "ISCA"
  # Then I click on the "Edit" button 
  And I should see "Edit Existing Event"
  And I should see "Name"
  And I should see "Location"
  And I should see "Check Sign-Up Info"
  # #check if specific user appears 
  # And I shouls see "mentor1"