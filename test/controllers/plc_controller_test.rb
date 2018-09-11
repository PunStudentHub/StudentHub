require 'test_helper'

class PlcControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plc_index_url
    assert_response :success
  end

end
