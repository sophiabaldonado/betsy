require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product must belong to a user" do
    p users(:mike).user_id
    p products(:p_one).user_id
    assert_equal products(:p_one).user_id, users(:mike).user_id
  end


end
