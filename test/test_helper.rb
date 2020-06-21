require 'coveralls'
Coveralls.wear!
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Disable authentication in tests to not have to worry about it
  ActiveAdmin.application.authentication_method = false
  ActiveAdmin.application.current_user_method = false

  # Add more helper methods to be used by all tests here...
end
