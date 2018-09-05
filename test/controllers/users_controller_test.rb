require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
    @other_user = users(:two)
  end

#  test "should get new" do
#    get login_url
#    assert_response :success
#  end

#  test "should redirect index when not logged in" do
#    get users_path
#    assert_redirected_to login_url
#  end

#  test "should not allow the admin attribute to be edited from outside" do
#    log_in_as(@other_user)
#    assert_not @other_user.admin?
#    patch user_path(@other_user), params: { user: {password: "password_two",
#      password_confirmation: "password_two", admin: true}}
#    assert_not @other_user.reload.admin?
#  end

#  test "redirects home if logged in as non-admin" do
#    log_in_as(@other_user)
#    assert_no_difference 'User.count' do
#      delete user_path(@user)
#    end
#    assert_redirected_to root_url
#  end


end
