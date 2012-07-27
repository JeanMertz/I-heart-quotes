# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rocco' do
  watch(%r{^app/.*\.(rb|coffee)$})
  watch(%r{^lib/.*\.rb$})
end

guard 'annotate' do
  watch('db/schema.rb')
  watch(%r{^app/models/.*\.rb$})
end

guard 'rspec', cli: '--color --fail-fast --format progress' do
  watch('spec/spec_helper.rb')                        { 'spec' }
  watch('app/controllers/application_controller.rb')  { 'spec/controllers' }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
end

guard 'cucumber', cli: '--no-profile --no-snippets --color --strict --format pretty', run_all: { cli: '--format progress' } do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})                      { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end

guard 'pow', cli: '--notify false' do
  watch('.powrc')
  watch('.powenv')
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.*\.rb$})
  watch(%r{^config/initializers/.*\.rb$})
end
