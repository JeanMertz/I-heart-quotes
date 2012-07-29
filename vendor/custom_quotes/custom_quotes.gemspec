$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "custom_quotes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "custom_quotes"
  s.version     = CustomQuotes::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CustomQuotes."
  s.description = "TODO: Description of CustomQuotes."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.7"
  s.add_dependency 'pg'
  s.add_dependency 'simple_form'
  s.add_dependency 'haml-rails'
  s.add_dependency 'sass-rails'
  s.add_dependency 'bootstrap-rails'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency 'bootstrap-generators'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rails3-generators'
end
