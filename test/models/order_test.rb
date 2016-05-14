require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "order one's order id equals 1" do
    assert orders(:one).id == 1
  end

  test "order one's order items include order_item one" do
    assert_includes orders(:one).order_items, order_items(:one)
  end

  test "order should have a status" do
    assert orders(:one).status
  end

  test "orders filter by status" do
    @orders = Order.all
    order = Order.find(1)
    assert_equal 1, order.orders_by_status(@orders, "pending").count
  end

  test "order two has a billing with id 1" do
    assert_equal orders(:two).billing.id == 1
  end

end

# order should have a status
# status should change when you update
# orders should have a billing id and can belong to a user (saves user if user)
# add cristals products, make sure the total is correct
# validate order number is unique
