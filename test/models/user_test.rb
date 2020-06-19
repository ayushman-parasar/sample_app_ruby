require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.create(name:"ayush", email:"a1@gmail.com", password:"hello", password_confirmation:"hello")
  end
  
  
  test "should be valid" do
    assert_not @user.valid?
  end

  test "name should be present" do
    @user.name=""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email=""
    assert_not @user.valid?
  end

  test "checking of email validation" do
    valid_addresses = %w[foo..com, goo@,com, foo@bar+baz.com]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_not @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present " do
    @user.password = @user.password_confirmation = " " * 5
    assert_not @user.valid?
  end

  test "password should be minimum of 4 " do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end