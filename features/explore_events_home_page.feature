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
  

