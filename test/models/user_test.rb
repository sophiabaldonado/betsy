require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user can have username" do
    assert_equal "Mike_bb", users(:mike).username
  end

end
