class BillingsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
  end

  def show
  end

  def new
      @carrier_price = params[:carrier].split(',').first.to_f/100
      @carrier_type =params[:carrier].split(',').last
    if current_user
      @cart_items = current_user.cart_items
    else
      @cart_items = CartItem.where(session_id: session[:session_id])
    end
    @subtotal = @cart_items.map { |item| item.quantity * item.product.price }.reduce(:+)
    if current_user
      @billing = Billing.find_by(user_id: session[:user_id])
      unless @billing
        @billing = Billing.new
      end
    else
      @billing = Billing.new
    end
    if current_user
      @user = User.find(session[:user_id])
    else
      @user = User.new
    end
    render :new
  end

  def create

    @billing = Billing.new(billing_params[:billing])
  end

  def update

  end
end

private
  def billing_params
    params.permit(billing: [:first_name, :last_name, :cc, :cvv, :expiration_date, :email, :billing_zip, :address, :address2, :city, :state, :zip, :user_id])

  end
