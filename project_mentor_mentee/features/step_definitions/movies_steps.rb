
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /^I press "(.*)" button/ do |button|
  click_button button
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

Then /I should (not )?see the following movies: (.*)$/ do |present, movies_list|
  movies = movies_list.split(', ')
  movies.each do |movie|
    if present.nil?
      expect(page).to have_content(movie)
    else
      expect(page).not_to have_content(movie)
    end
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end

Then /^the director of "(.+)" should be "(.+)"/ do |movie_name, director|
   movie = Movie.find_by(title: movie_name)
   #visit movie_path(movie)
   #expect(page.body).to match(/Director:\s#{director}/)
   expect(movie.director).to eql(director)
   
 end