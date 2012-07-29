FactoryGirl.define do
  factory :quote_source do
    sequence(:source_name)  { |n| "I <3 Quotes #{n}" }

    source_url              'http://www.iheartquotes.com/'
    api_url                 'http://www.iheartquotes.com/api/v1/random.json'
    response_type           'json'
    quote_reference         'quote'
    permalink_reference     'link'
    author_reference        'source'
  end
end
