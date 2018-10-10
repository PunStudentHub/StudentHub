require 'test_helper'

class ClubsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clubs_new_url
    assert_response :success
  end

  test "should get create" do
    get clubs_create_url
    assert_response :success
  end

  test "should get edit" do
    get clubs_edit_url
    assert_response :success
  end

  test "should get update" do
    get clubs_update_url
    assert_response :success
  end

  test "should get show" do
    get clubs_show_url
    assert_response :success
  end

  test "should get index" do
    get clubs_index_url
    assert_response :success
  end

  test "should get destroy" do
    get clubs_destroy_url
    assert_response :success
  end

end
