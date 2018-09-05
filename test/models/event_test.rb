require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @user = users(:one)
    @event = @user.events.build(title: "Sample Event", location: "G204", description: "hi",
      start_time: 2.hours.from_now, end_time: 3.hours.from_now)
  end

  test "sample unit is valid" do
    assert @event.valid?
  end


  test "event title should be present" do
    @event.title = ""
    assert_not @event.valid?
  end

  test "event location should be present" do
    @event.location = ""
    assert_not @event.valid?
  end

  test "event title should not be too long" do
    @event.title = "a" * 144
    assert_not @event.valid?
  end

  test "end time should be after start time" do
    @event.start_time = 3.hours.from_now
    @event.end_time = 1.hours.from_now
    assert_not @event.valid?
  end

  test "start time must be in future" do
    @event.start_time = 3.hours.ago 
    assert_not @event.valid?
  end

  test "end time must be in future" do
    @event.end_time = 3.hours.ago
    assert_not @event.valid?
  end
end
