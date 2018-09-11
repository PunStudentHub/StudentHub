require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  
  def setup
    @subject = Subject.new(name: "Fizzix")
  end

  test "should be valid" do
    assert @subject.valid?
  end

  test "should have name" do
    @subject.name = ""
    assert_not @subject.valid?
  end
end
