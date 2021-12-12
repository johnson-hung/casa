Feature: display announcements on CALM homepage 

  As a participant 
  So that I can know what the newest information is 
  I want to see announcements through the home page view 

Background: announcements have been added to database

  Given the following announcements exist:
  | title              | author  | rating | release_date |
  | Announcement_1     | Name_1  | G      | 25-Nov-1992  |
  | Announcement_2     | Name_2  | R      | 26-Oct-1984  |
  | Announcement_3     | Name_3  | R      | 21-Jul-1989  |

  And the following events exist:
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
  Then 3 seed announcements should exist

Scenario: see an announcements
  Given I am on the home page 
  Then I should see "Announcement_1"
  
Scenario: login button exist
  Given I am on the home page
  Then I should see "Login"
  
Scenario: login button is redirectable
  When I click on the "Login" button
  Then I should be on the user login page
  And I should see "Password"
  

Scenario: Signup button exist 
  Given I am on the home page
  Then I should see "Signup"
  And I should not see "Log out"
  
Scenario: Signup button is redirectable
  # When I click on the "Signup" button
  When I click on the "Signup" button
  Then I should be on the user Signup page
  And I should see "User Sign Up"
  
  

#check if user signup for the event
Scenario: User signup for a event
  Given I am on the user login page
  # might have to login in first
  Then I fill in "Email" with "mentor1@tamu.edu"
  And I fill in "Password" with "password"
  When I press "Log in"
  # Then I should see "Login successful"
  And I am on the CALM home page
  And I should see "mentor1@tamu.edu"
  
  # Then I should see "Join"
  When I am on the event page
  And I should see "Starting Date"
  And I should see "ISCA"
  And I should see "Events"
  # When I press "Joined"
  And I should see "Join"





