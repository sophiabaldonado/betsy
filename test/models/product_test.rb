require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product must belong to a user" do
    assert_equal products(:p_one).user_id,
  end

  end
end
