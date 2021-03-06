require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def is_logged_in?
    !session[:user_id].nil?
  end

  def login(user)
    post login_url, params: {session: { name:  user.name, password: 'secret'}}
  end

  def login_for_capybara(user)
    visit login_path
    fill_in "Name", with: user.name
    fill_in "Password", with: 'secret'
    click_button "Log in"
  end

end
