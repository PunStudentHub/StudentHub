require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_url
    assert_response :success
  end

  #test "should get help" do
    #get pages_help_url
    #assert_response :success
  #end

  #test "should get contact" do
    #get pages_contact_url
    #assert_response :success
  #end

end
