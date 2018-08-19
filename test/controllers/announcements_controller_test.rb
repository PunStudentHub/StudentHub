require 'test_helper'

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @announcement = announcements(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Announcement.count' do
      post announcements_path, params: { announcement: { title: "Hello, world!", content: "Lorem Ipsum"}}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Announcement.count' do
      delete announcement_path(@announcement)
    end
    assert_redirected_to login_url
  end

  
end
