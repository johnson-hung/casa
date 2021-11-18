Feature: display events on CALM homepage 

  As a participant 
  So that I can see the events that have not yet happened 
  I want to see the events through the home page view 

Background: events have been added to database

  Given the following announcements exist:
  | name       | location   | start_at    | end_at       |
  | ISCA       | New York   | 21-Jun-2000  | 21-Jun-2022  |
  | HPCA       | Denver     | 21-Jun-2001  | 21-Jun-2025  |
  | ASPLOS     | Seattle    | 21-Jun-2002  | 21-Jun-2032  |

  And I am on the CALM home page
  Then 3 seed events should exist

#Scenario: sort movies alphabetically
#  When I follow "Movie Title"
#  # your steps here
#  Then I should see "2001: A Space Odyssey" before "Aladdin"
#  Then I should see "Aladdin" before "Amelie"
#  Then I should see "Chicken Run" before "Chocolat"
#  Then I should see "The Help" before "The Incredibles"
#
#Scenario: sort movies in increasing order of release date
#  When I follow "Release Date"
#  # your steps here
#  Then I should see "More about 2001: A Space Odyssey" before "More about Raiders of the Lost Ark"
#  Then I should see "More about The Terminator" before "More about When Harry Met Sally"
#  Then I should see "More about Aladdin" before "More about Chicken Run"
#  Then I should see "More about Raiders of the Lost Ark" before "More about Chocolat"
#
#
#Scenario: filter and sort a movie by release date
#  Given I am on the home page
#  When I uncheck the following ratings: PG-13, NC-17, R
#  And I should see "Aladdin"
#  When I follow "Release Date"
#  Then I should see "Raiders of the Lost Ark" before "Aladdin"
#  When I follow "Release Date"
#  Then I should see "More about Raiders of the Lost Ark" before "More about Aladdin"
