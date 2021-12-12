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

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |users|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create!(users)
  end
  # fail "Unimplemented"
end

# Given /the following user signup exist/ do |users_table|
Then /the signup should include "([^"]*)"$/ do |name|
  # event = Event.find_by(name: "ISCA")
  user = User.find_by(first_name: name)
  userevent = UserEvent.find_by(user)
  # UserEvent.create!(userevent)
end


Then /(.*) seed announcements should exist/ do | n_seeds |
  # Movie.count.should be n_seeds.to_i
  expect(Announcement.count).to eq n_seeds.to_i
end

Then /(.*) seed users should exist/ do | n_seeds |
  # Movie.count.should be n_seeds.to_i
  expect(User.count).to eq n_seeds.to_i
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /I click on the "(.+)" button/ do |button|
  page.click_link button
end


When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )check "([^"]*)"$/ do |field|
  check(field)
end

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should =~ /#{value}/
end


