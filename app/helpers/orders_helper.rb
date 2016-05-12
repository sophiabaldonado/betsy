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

  def merchant_fulfillment_view
    "/users/#{current_user.id}/sold" == request.env['PATH_INFO'] ||
    "/users/#{current_user.id}/sold/#{@order.id}" == request.env['PATH_INFO']
  end

end
