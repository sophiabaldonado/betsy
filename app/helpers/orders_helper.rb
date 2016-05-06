module OrdersHelper
  def order_number
    rand(10000..99999)
  end

  def total_revenue(order)
    order.order_items.map { |item| item.price }.reduce(:+)
  end

  def price_by_quantity(cart_item)
    cart_item.product.price * cart_item.quantity
  end
end
