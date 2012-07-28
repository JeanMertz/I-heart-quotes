# encoding: UTF-8

Given /^I know my way around the interwebs$/ do
  # let's just make this an assumption
end

When /^I visit the I <3 Kabisa website$/ do
  visit '/'
  current_path.should eq('/')
end

Then /^I should be greeted by a quote$/ do
  page.should have_xpath("//div[@id='quote_field']", text: /^“.*”$/)
end

Given /^I am on the random quotes page$/ do
  visit '/'
  current_path.should eq('/')
end

When /^I click the (permalink|sourcelink)$/ do |link|
  @link_url = find("a.#{link}")['href']
  click_link(link)
end

Then /^I should be redirected$/ do
  current_url.should include(@link_url)
end

Given /^a sourcelink is visible$/ do
  page.should have_css('a.sourcelink')
end

When /^I reload the page "(.*?)" times$/ do |reload|
  @quotes = []
  reload.to_i.times do |i|
    visit '/'
    @quotes[i] = find('div#quote_field').native.inner_text
  end
end

Then /^I should see at least two different quotes$/ do
  @quotes.uniq.size.should be > 2
end
