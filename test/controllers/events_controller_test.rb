require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get events" do
    get events_url
    assert_response :success
  end
  
end
