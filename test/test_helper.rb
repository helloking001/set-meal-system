ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require 'mocha/minitest'
require 'mocha/setup'
class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  setup do
    # using_test_config
    Rails.cache.clear
    load_current_user
    DatabaseCleaner.start
  end
  teardown do
    DatabaseCleaner.clean
  end
  def load_current_user
    User.create(empoid: :test_user)
    ApplicationController.any_instance.stubs(:current_user).returns(User.first)
  end



  def json_res
    JSON.parse(@response.body)
  end

end
