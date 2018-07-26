require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    patch user_path(@user), params:{ user:{ name: "",
                                            email: "email@gmail.com",
                                            password: "sh",
                                            password_confirmation: "notsh"}}
    
  end

  test "successful edit" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
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
