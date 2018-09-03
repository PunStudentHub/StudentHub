require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
    @other_user = users(:two)
  end

  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    #assert flash.empty?
    assert_redirected_to edit_user_path(@user)
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: 'New Name',
                                              email: 'asdf1234@punahou.edu' }}
    @user.reload
    assert_not_equal @user.name, 'New Name'
    assert_not_equal @user.email, 'asdf1234@punahou.edu'
    #assert flash.empty?
    assert_redirected_to edit_user_path(@user)
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should not allow the admin attribute to be edited from outside" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: { user: {password: "password_two",
      password_confirmation: "password_two", admin: true}}
    assert_not @other_user.reload.admin?
  end

  test "doesn't destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test "redirects home if logged in as non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end


end
