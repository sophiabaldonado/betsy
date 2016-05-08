module ApplicationHelper

  def number_of_cart_items
    user_items = @current_user.cart_items if @current_user
    session_items = CartItem.where(session_id: session[:session_id]) # does session cart_items reset?
    @current_user ? cart_count(user_items) : cart_count(session_items)
  end

  def cart_count(items)
    items.reduce(0) { |sum, item| sum + item.quantity }
  end
end
