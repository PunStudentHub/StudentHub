ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user)
    post login_url, params: { session: { name: user.name, email: user.email, 
      password: user.password, password_confirmation: user.password_confirmation}}
  end
end
