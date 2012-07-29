# encoding: UTF-8

When /^I visit the I ♥ Kabisa website$/ do
  visit '/'
  current_path.should eq('/')
end

Then /^I should be greeted by a quote$/ do
  page.should have_xpath("//div[@id='quote_field']", text: /.?/)
end

When /^I click the (permalink|sourcelink)$/ do |link|
  @link_url = find("a.#{link}")['href']
  click_link(link)
end

Then /^I should be redirected$/ do
  current_url.should include(@link_url)
end

Then /^a sourcelink should be visible$/ do
  page.should have_css('a.sourcelink')
end

When /^I reload the page "(.*?)" times$/ do |reload|
  @quotes = []
  reload.to_i.times do
    visit '/'
    @quotes << find('div#quote_field').native.inner_text
  end
end

Then /^I should see at least two different quotes$/ do
  @quotes.uniq.size.should be > 2
end
