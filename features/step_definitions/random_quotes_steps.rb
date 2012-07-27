Given /^I know my way around the interwebs$/ do
  # let's just make this an assumption
end

When /^I visit the I <3 Kabisa website$/ do
  visit '/'
  current_path.should == '/'
end

Then /^I should be greeted by a quote$/ do
  page.should have_content('this is a static quote')
end
