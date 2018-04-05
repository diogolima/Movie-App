ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in(user)
    post user_session_path \
      "user[email]"    => user.email,
      "user[encrypted_password]" => user.password
  end

  def sign_in_user
    @user = User.create(email: "myemail@me.com", encrypted_password: 'password', id: 1, created_at: Time.now, updated_at: Time.now)
    sign_in @user
  end

  def sign_in_for(subject)
    sign_in_user
    att_user_model(subject, @user)
  end

  def att_user_model(subject, user)
    subject.update_attribute(:user, user)
  end

  def att_diff_user(subject)
    @user2 = User.create(email: "myemail@me.com", encrypted_password: 'password', id: 2, created_at: Time.now, updated_at: Time.now)
    att_user_model(subject, @user2)
  end
end
