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


Given /the following announcements exist/ do |announcements_table|
  announcements_table.hashes.each do |announcements|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Announcement.create!(announcements)
  end
  # fail "Unimplemented"
end

Then /(.*) seed announcements should exist/ do | n_seeds |
  # Movie.count.should be n_seeds.to_i
  expect(Announcement.count).to eq n_seeds.to_i
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end