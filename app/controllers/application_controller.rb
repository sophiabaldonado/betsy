class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :keep_cart_items
  before_action :require_login
  skip_before_action :verify_authenticity_token, if: :json_request?


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


  def keep_cart_items(cart_items)
    unless cart_items.nil?
      cart_items.each do |item|
        # if item.product is already in the @user.cart_items, update the quantity
        # of the cart_item in the @user.cart_items to add the item.quantity
        item.update(user_id: @user.id)
        item.update(session_id: nil)
      end
    end
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to view this section"
      redirect_to login_path
    end
  end

  def all_orders_revenue(orders)
    return 0 if orders.nil?
    orders.each.reduce(0) { |sum, order| order.order_items.reduce(0) { |sum, item| price_by_quantity(item) }  }
  end

  def total_order_revenue(cart_items)
    cart_items.reduce(0) { |sum, item| price_by_quantity(item) }
  end

  def orders_by_status(orders, status)
    orders.select { |order| order if order.status == status }
  end

  protected
  
  def json_request?
    request.format.json?
  end
end
