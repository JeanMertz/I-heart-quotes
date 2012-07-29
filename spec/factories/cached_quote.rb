FactoryGirl.define do
  factory :cached_quote do
    quoted_text           { (0...50).map{ ('a'..'z').to_a[Kernel.rand(26)] }.join }
    sequence(:author)     { |n| "name#{n}" }
    hashed_key            { Digest::SHA1.hexdigest(quoted_text + author) }
    sequence(:sourcelink) { |n| "http://iheartquotes.com/fortune/show/#{n}" }
  end
end
