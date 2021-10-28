Feature: display list of movies sorted by different criteria

  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title or release date

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page
  Then 10 seed movies should exist

Scenario: sort movies alphabetically
  When I follow "Movie Title"
  # your steps here
  Then I should see "2001: A Space Odyssey" before "Aladdin"
  Then I should see "Aladdin" before "Amelie"
  Then I should see "Chicken Run" before "Chocolat"
  Then I should see "The Help" before "The Incredibles"

Scenario: sort movies in increasing order of release date
  When I follow "Release Date"
  # your steps here
  Then I should see "More about 2001: A Space Odyssey" before "More about Raiders of the Lost Ark"
  Then I should see "More about The Terminator" before "More about When Harry Met Sally"
  Then I should see "More about Aladdin" before "More about Chicken Run"
  Then I should see "More about Raiders of the Lost Ark" before "More about Chocolat"


Scenario: filter and sort a movie by release date
  Given I am on the home page
  When I uncheck the following ratings: PG-13, NC-17, R
  And I should see "Aladdin"
  When I follow "Release Date"
  Then I should see "Raiders of the Lost Ark" before "Aladdin"
  When I follow "Release Date"
  Then I should see "More about Raiders of the Lost Ark" before "More about Aladdin"