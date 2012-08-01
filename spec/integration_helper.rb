require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/integration/macros/**/*.rb"].each { |f| require f }

Capybara.configure do |config|
  config.javascript_driver = :poltergeist
  config.ignore_hidden_elements = true
  config.default_selector = :css
  config.default_wait_time = 10
end

RSpec.configure do |config|
  config.include IntegrationHelpers, type: :request
  config.after(:all, type: :request) { delete_movie_index }
end
