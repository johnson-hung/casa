# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
    	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984'},
    	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989'},
      	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
      	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001'},
      	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001'},
      	  {:title => '2001: A Space Odyssey', :rating => 'G', :release_date => '6-Apr-1968'},
      	  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004'},
      	  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981'},
      	  {:title => 'Chicken Run', :rating => 'G', :release_date => '21-Jun-2000'},
  	 ]

movies.each do |movie|
  Movie.create!(movie)
end

announcements = [
        {:description => 'Announcement A, Announcement A, Announcement A, Announcement A, Announcement A, Announcement A'},
        {:description => 'Announcement B, Announcement B, Announcement B, Announcement B, Announcement B, Announcement B'},
        {:description => 'Announcement C, Announcement C, Announcement C, Announcement C, Announcement C, Announcement C'},
  	 ]

announcements.each do |announcement|
  Announcement.create!(announcement)
end

events = [
        {:name => 'ISCA', :location  => 'New York', :start_at => '21-Jun-2000', :end_at => '21-Jun-2022'},
        {:name => 'HPCA', :location  => 'Denver', :start_at => '21-Jun-2001', :end_at => '21-Jun-2025'},
        {:name => 'ASPLOS', :location  => 'Seattle', :start_at => '21-Jun-2002', :end_at => '21-Jun-2032'},
    ]

events.each do |event|
    Event.create!(event)
end

users = [
        {:account_name => 'mentor1', :password => 'password', :first_name => 'mentor1', :last_name => 'mentor1', :organization => 'Texas A&M', :email => 'mentor1@tamu.edu', :phone => '1234567890', :mentor => 1, :mentee => 0},
        {:account_name => 'mentor2', :password => 'password', :first_name => 'mentor2', :last_name => 'mentor2', :organization => 'Texas A&M', :email => 'mentor2@tamu.edu', :phone => '1234567890', :mentor => 1, :mentee => 0},
        {:account_name => 'mentee1', :password => 'password', :first_name => 'mentee1', :last_name => 'mentee1', :organization => 'Texas A&M', :email => 'mentee1@tamu.edu', :phone => '1234567890', :mentor => 0, :mentee => 1},
    ]

users.each do |user|
    User.create!(user)
end