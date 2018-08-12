require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @announcement = @user.microposts.build(title: "Sample Title", content: "Lorem Ipsum")
  end

  test "should be valid" do 
    assert @announcement.valid?
  end

  test "user id should be present" do 
    @announcement.user_id = nil
    assert_not @announcement.valid?
  end

  test "content should be present" do
    @announcement.content = " "
    assert_not @announcement.valid?
  end

  test "title should be present"  do
    @announcement.title = " "
    assert_not @announcement.valid?
  end

  test "title should be no more than 140 characters" do
    @announcement.title = "a" * 141
    assert_not @announcement.valid?
  end

end
