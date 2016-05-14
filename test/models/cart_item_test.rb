require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "cart item belongs to product" do
    assert_equal cart_items(:one).product_id, 1
  end

  test "cart item quantity can not be less than 0" do
    cart = cart_items(:one)
    assert_equal cart.update(:quantity => -1), false   
  end
end
