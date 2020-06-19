require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: {
        user: {
          name: "",
          email: "s12@gmail.com",
          password: "qwerty",
          password_confirmation: "qwerty"
        }
      }
    end
    assert_template "users/new"
  end

  test "valid signup test" do
    get signup_path
    assert_difference "User.count",1 do
      post users_path, params:{
        user: {
          name: "student",
          email: "s12@gmail.com",
          password: "qwerty",
          password_confirmation: "qwerty"
        }
      }
    end
    follow_redirect!
    assert_template "users/show"
    assert_not flash.empty?
  end
end
