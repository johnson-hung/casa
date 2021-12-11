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

  And I am on the CALM home page
  Then 3 seed events should exist

Scenario: see an event
  Given I am on the home page 
  Then I should see "Conference"
  And I should see "Location"
  And I should see "Starting Date"
  And I should see "ISCA"
  And I should see "New York"
  
# #check if user signup for the event
# Scenario: User signup for a event
#   Given I am on the home page
#   # might have to login in first
#   Then I fill in "Email" with "mentor1@tamu.edu"
#   And I fill in "Password" with "password"
#   When I press "Log in"
#   Then I should see "Login successful"
#   And I am on the CALM home page
  
#   Then I should see "Join"
#   When I press "Join"
#   # need to add the path in paths.rb
#   Then I should be on the event signup page 
#   And I should see "Verify your info"
#   When I press "Submit"
#   Then I should see "Successfully signed up"
#   And I am on the CALM home page
#   And I should see "Joined"
  
#   When I click on the "Log out" button
#   Then I should see "Successfully logged out"
#   And I should not see "Joined"


