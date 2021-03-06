# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (CALM )?home\s?page$/ then '/announcements'
    # we will need this after events on the view
    # when /^the (CALM )?home\s?page$/ then '/events'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    
    when /^the home\s?page$/
      # movies_path
      announcements_path
      
    when /^the edit page for "(.*)"$/
      # movie_id = Movie.find_by(title: $1).id
      # edit_movie_path(movie_id)
      
      announcement_id = Announcement.find_by(title: $1).id
      edit_movie_path(announcement_id)
      
      # event_id = Event.find_by(title: $1).id
      # edit_movie_path(announcement_id)
      
    when /^the details page for "(.+)"$/
      movie = Movie.find_by(title: $1)
      movie_path(movie)
      
      
    when /^the user Signup page$/
      # signup_url
      signup_path

    when /^the user login page$/
      login_path
      
    when /^the user account page for \"(.+)\"$/
      edit_user_path($1)
    
    when /^the edit event page for "(.+)"$/
      # edit_event_path(Event.find_by(:name => $1))
      event = Event.find_by(name: $1)
      edit_event_path(event)
    
    when /^the event signup page for "(.+)"$/
      event = Event.find_by(name: $1)
      events_signup_path(event)
      
    when /^the event page$/
      events_path
    
    # when /^the edit announcement page for \"(.+)\"$/
    #   edit_event_path($1)

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
