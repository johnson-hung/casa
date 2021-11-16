require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)


Given /the following events exist/ do |events_table|
  events_table.hashes.each do |events|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Event.create!(events)
  end
  # fail "Unimplemented"
end

Then /(.*) seed events should exist/ do | n_seeds |
  # Movie.count.should be n_seeds.to_i
  expect(Event.count).to eq n_seeds.to_i
end

