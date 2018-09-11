require 'test_helper'

class TimeslotTest < ActiveSupport::TestCase
  def setup
    @timeslot = Timeslot.new(day: 0, time: 1)
  end

  test "should be valid" do
    assert @timeslot.valid?
  end

  test "day should be between 0 and 5" do
    @timeslot.day = 6
    assert_not @timeslot.valid?
  end

  test "time should be between 0 and 7" do 
    @timeslot.time = 8
    assert_not @timeslot.valid?
  end
end
