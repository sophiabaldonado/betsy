class OrdersController < ApplicationController
  include OrdersHelper
  skip_before_action :require_login, only: [:new, :update_cart, :destroy, :create, :show]


  def index
    if params[:user_id].to_i == current_user.id
      @user = User.find(current_user.id)
      @order = Order.new
      @order_items = OrderItem.where(:product_id => @user.products)
      if '/sold' == request.env['PATH_INFO']
        @order_items_orders = @order_items.map { |item| item.order_id }
        @orders = Order.where(id: @order_items_orders)
      else
        @orders = Order.where(user_id: @user.id)
      end
      params[:status] == "all orders" || params[:status].nil? ? @display_orders = @orders : @display_orders = @display_orders.orders_by_status(params[:status])
      @total = all_orders_revenue(@display_orders)
      @statuses = ["all orders", "paid", "pending", "complete", "cancelled"]
      @status = params[:status] if params[:status]
    else
      redirect_to login_path
    end
  end

  def show
    @user = User.find(session[:user_id])
    @order = Order.find(params[:id])
    if "/users/#{current_user.id}/sold/#{@order.id}" == request.env['PATH_INFO']
      @order_items = OrderItem.where(:product_id => @user.products)
    else
      @order_items = OrderItem.where(:order_id => @order.id)
    end
  end

  def new
    @products = Product.where(deleted: false, retired: false).where("inventory > 0")
    @order = Order.new
    if current_user
      @cart_items = current_user.cart_items
    else
      @cart_items = CartItem.where(session_id: session[:session_id])
    end
    # raise
    @subtotal = @cart_items.map { |item| item.quantity * item.product.price }.reduce(:+)
  end

  def create
    @billing = Billing.new(billing_params[:billing])
    if @billing.save
      if current_user
        @cart_items = CartItem.all.where(user_id: session[:user_id])
      else
        @cart_items = CartItem.all.where(session_id: session[:session_id])
      end
      @user_id = session[:user_id] if session[:user_id]
      @billing_id = @billing.id
      @order_number = order_number
      @order = Order.new(status: "pending", total: total_order_revenue, confirmation_date: Time.now, order_number: @order_number, billing_id: @billing_id, user_id: @user_id)
      if @order.save
        @cart_items.each do |item|
          @order_item = OrderItem.new(quantity: item.quantity, name: item.product.name, price: item.product.price*item.quantity, status: "pending", order_id: @order.id, product_id: item.product.id)
          @order_item.save
          item.destroy
          @order_item.product.update(inventory: @order_item.product.inventory - @order_item.quantity)
        end
        if current_user
          redirect_to user_order_path(current_user.id, @order.id)
        else
          redirect_to checkout_confirmation_path(@order.id)
        end
      else
        render '/billing/new'
      end
    else
      render '/billing/new'
    end
  end

  def update_cart
    @cart_item = CartItem.find(update_cart_params[:id])
    @cart_item.update(quantity: update_cart_params[:quantity])
    redirect_to action: "new"

  end

  def item_shipped
    @order_item = OrderItem.find(update_item_params[:OrderItem][:shipped])
    @order_item.update(status: "complete")
    redirect_to sold_path
  end

  def destroy
    @cart_item = CartItem.find(params[:todelete])
    @cart_item.delete
    redirect_to action: "new"
  end

  private
  def update_cart_params
    params.permit(:quantity, :id)
  end

  def update_item_params
    params.permit(OrderItem: [:shipped])
  end


  def billing_params
    params.permit(billing: [:first_name, :last_name, :cc, :cvv, :expiration_date, :email, :billing_zip, :address, :city, :state, :zip, :user_id])

  end
end
