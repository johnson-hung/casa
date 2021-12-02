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
  
  

# Scenario: should not see 


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
