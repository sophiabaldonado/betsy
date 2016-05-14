require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a product has many categories" do
    assert_equal 2, products(:p_one).categories.count
  end
end
