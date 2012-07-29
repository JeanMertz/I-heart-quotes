FactoryGirl.define do
  factory :external_quote do
    quoted_text           { (0...50).map{ ('a'..'z').to_a[Kernel.rand(26)] }.join }
    sequence(:author)     { |n| "name#{n}" }
    sequence(:sourcelink) { |n| "http://iheartquotes.com/fortune/show/#{n}" }
    quote_source_id       1
  end
end
