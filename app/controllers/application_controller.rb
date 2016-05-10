class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :keep_cart_items
  before_action :require_login


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def keep_cart_items(cart_items)
    unless cart_items.nil?
      cart_items.each do |item|
        item.update(user_id: @user.id)
      end
    end
  end


  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  #
  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to view this section"
      redirect_to new_user_path
    end
  end

  # @cart_items = CartItem.all
end
