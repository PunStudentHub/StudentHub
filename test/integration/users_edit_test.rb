require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params:{ user:{ name: "",
                                            email: "email@gmail.com",
                                            password: "sh",
                                            password: "notsh"}}
    assert_template 'users/edit'
    
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "User Name"
    email = "example19@punahou.edu"
    patch user_path(@user), params: { user:{ name: name,
                                             email: email,
                                             password: "", 
                                             password_confirmation: ""}}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload 
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

end
