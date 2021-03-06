source 'https://rubygems.org'

gem 'rails', '3.2.7'
gem 'pg'
gem 'unicorn'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'kue'
gem 'haml-rails'
gem 'bootstrap-sass'
gem 'compass-rails'
gem 'simple_form'
gem 'jquery-rails'

gem 'custom_quotes', path: 'vendor/custom_quotes'

group :development do
  gem 'bootstrap-generators'
  gem 'annotate', github: 'ctran/annotate_models'
  gem 'rocco', github: 'rtomayko/rocco'
  gem 'guard'
  gem 'guard-pow'
  gem 'guard-annotate'
  gem 'guard-rocco'
  gem 'guard-rspec'
  gem 'guard-cucumber'
end

group :test do
  gem 'database_cleaner'
  gem 'rails3-generators', github: 'indirect/rails3-generators'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', require: false
  gem 'capybara'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'fakeweb'
  gem 'launchy'
end
