module ApplicationHelper

  def number_of_cart_items
    user_items = current_user.cart_items if current_user
    session_items = CartItem.where(session_id: session[:session_id]) # does session cart_items reset?
    current_user ? cart_count(user_items) : cart_count(session_items)
  end

  def cart_count(items)
    items.reduce(0) { |sum, item| sum + item.quantity }
  end

  def current_page
    request.env['PATH_INFO']
  end

  def any_product_path
    current_page == "/products" || current_page == "/products/#{params[:id]}"
  end

  def any_checkout_path
    current_page == "/checkout" || current_page == "/billings/new"
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end
end
