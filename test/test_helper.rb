require 'simplecov'
SimpleCov.start 'rails'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.

  fixtures :all
  # THIS IS THE LINE WE COMMENTED OUT:
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
