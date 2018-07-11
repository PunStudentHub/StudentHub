require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Devin Hartzell", email: "user@punahou.edu", 
      password: "foobaraa", password_confirmation: "foobaraa") 
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do 
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do 
    @user.email = "     "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do 
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do 
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@punahou.edu hyphenated-email19@punahou.edu user19@punahou.edu]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "invalid email addresses should be invalid" do # Thanks Mrs. Lian!
    invalid_addresses = %w[foo@gmail.com parentallzzz@yahoo.com abacadabra@notpunahou.edu kdwong19@iolani.org
                           user_at_punahou_dot_edu user@punahou_edu user@punahou,edu user#punahou.edu]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should not be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lowercase" do 
    mixed_case_email = "hElLo19@punahou.edu"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end




end