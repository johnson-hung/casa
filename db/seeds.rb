# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

announcements = [{:title => 'Announcing MaSS/MaSA at ISCA 2022!', :author => 'Organizer 1', :release_date => '13-Dec-2021'},
           {:title => 'Sign up for the CALM pilot program for 2022', :author => 'Organizer 2', :release_date => '26-Oct-2021'}, 
           {:title => 'Learn more about the CALM pilot program at MICRO 2021', :author => 'Organizer 1', :release_date => '21-Sep-2021'},  	 
           {:title => 'Sign up for MaSS/MaSA at MICRO 2021 by today!', :author => 'Organizer 2', :release_date => '20-Sep-2021'},  	 
]

announcements.each do |announcement|
  Announcement.create!(announcement)
end

# announcements = [
#         {:description => 'Announcement A, Announcement A, Announcement A, Announcement A, Announcement A, Announcement A'},
#         {:description => 'Announcement B, Announcement B, Announcement B, Announcement B, Announcement B, Announcement B'},
#         {:description => 'Announcement C, Announcement C, Announcement C, Announcement C, Announcement C, Announcement C'},
#   	 ]

# announcements.each do |announcement|
#   Announcement.create!(announcement)
# end

events = [
        {:name => 'ISCA', :location  => 'New York', :start_at => '21-May-2021', :end_at => '21-Jun-2022'},
        {:name => 'ASPLOS', :location  => 'Seattle', :start_at => '14-Apr-2021', :end_at => '21-Apr-2021'},
        {:name => 'HPCA', :location  => 'Denver', :start_at => '21-Feb-2021', :end_at => '28-Feb-2021'},
    ]

events.each do |event|
    Event.create!(event)
end

users = [
        {:account_name => 'mentor1', :password => 'password', :first_name => 'mentor1', :last_name => 'mentor1', :organization => 'Texas A&M', :email => 'mentor1@tamu.edu', :phone => '1234567890', :mentor => 1, :mentee => 0},
        {:account_name => 'mentor2', :password => 'password', :first_name => 'mentor2', :last_name => 'mentor2', :organization => 'Texas A&M', :email => 'mentor2@tamu.edu', :phone => '1234567890', :mentor => 1, :mentee => 0},
        {:account_name => 'mentee1', :password => 'password', :first_name => 'mentee1', :last_name => 'mentee1', :organization => 'Texas A&M', :email => 'mentee1@tamu.edu', :phone => '1234567890', :mentor => 0, :mentee => 1},
        {:account_name => 'organizer', :password => 'organizer', :first_name => 'organizer', :last_name => 'organizer', :organization => 'Texas A&M', :email => 'organizer@tamu.edu', :phone => '1234567890', :mentor => 0, :mentee => 1, :organizer => 1},
    ]

users.each do |user|
    User.create!(user)
end
