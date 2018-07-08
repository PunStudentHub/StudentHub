require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "", email: "user@gmail.com", 
                                password: "a0", password_confirmation: "bw"}}
    end

    assert_template 'users/new'
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {name: "Valid Name", email: "valid19@punahou.edu", 
                                        password: "validpass", password_confirmation: "validpass"}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end

end
