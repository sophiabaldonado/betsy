require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user must have a username" do
    assert_equal "Mike_bb", users(:mike).username
  end


  test "user passwords must match" do
    brady = User.new(password: "bunch", password_confirmation: "brady")
    assert_not brady.valid?
    assert_includes brady.errors.keys, :password_confirmation
  end

  test "can authenticate known users" do
    mike = users(:mike)
    assert_equal mike, User.log_in(mike.email, "password")
  end

  test "won't authenticate a known user with a bad password" do
    mike = users(:mike)
    assert_not User.log_in(mike.email, "helloworld")
  end

  test "logged in user is equal to current_user" do
    current_user = users(:mike)
    mike = users(:mike)
    mike = User.log_in(mike.email, "password")
    assert_equal true, mike.current_user?(current_user)
  end

  test "profile picture for a user without a photo_url must equal default profile picture" do
    mike = users(:mike)
    default_photo = "http://images.cdn4.stockunlimited.net/clipart/add-user-icon_1598354.jpg"
    assert_equal default_photo, mike.profile_pic
  end

  test "profile picture for a user with a photo_url must equal user photo_url" do
    carol = users(:carol)
    user_photo = "https://pbs.twimg.com/profile_images/378800000825366505/ee5752df616efa87ee76f1db873670ca.jpeg"
    assert_equal user_photo, carol.profile_pic
  end

end
