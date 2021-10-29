Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and search on director information in movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |



Scenario: add a new movie
  When I am on the RottenPotatoes home page
  When I follow "Add new movie"
  And  I fill in "Title" with "A cool movie"
  And  I select "G" from "Rating" 
  And  I press "Save Changes"
  When I am on the RottenPotatoes home page
  Then   I should see "A cool movie"
  


Scenario: add director to existing movie
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Ridley Scott"
  
  
Scenario: change director name
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Peter Wu"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Peter Wu"
  
Scenario: delete director name
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "''" 
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "''"

Scenario: find movie with same director
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"
  
Scenario: add director to existing movie and find movie with the same director
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Given I am on the details page for "Alien"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Alien"
  And   I should see "Blade Runner"
  But   I should not see "Star Wars"


Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Alien"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Alien' has no director info"
