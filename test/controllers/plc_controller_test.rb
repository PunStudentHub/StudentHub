require 'test_helper'

class PlcControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get plc_show_url
    assert_response :success
  end

end
