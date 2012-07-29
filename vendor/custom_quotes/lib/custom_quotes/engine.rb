require 'rails'
require 'jquery-rails'
require 'bootstrap-sass'
require 'simple_form'

module CustomQuotes
  class Engine < ::Rails::Engine
    isolate_namespace CustomQuotes

    # Set default generators
    config.generators do |g|
      g.test_framework :rspec, view_specs: false, routing_specs: false,
        helper_specs: false, controller_specs: false, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.form_builder :simple_form
      g.template_engine :haml
    end
  end
end
