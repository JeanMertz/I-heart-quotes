Given /^a quote source is available to the service$/ do
  @quote_source = FactoryGirl.create(:quote_source)
end

Given /^a cached quote exists in the database$/ do
  @cached_quote = FactoryGirl.create(:cached_quote, quote_source: @quote_source)
end

Given /^the cached quote weight is set to (\d+)$/ do |weight|
  ApplicationController.stub(:cached_weight).and_return(weight)
end
