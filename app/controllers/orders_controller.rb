class OrdersController < ApplicationController
  include OrdersHelper

  def index
    @user = User.find(session[:user_id])
    @order = Order.new
    @order_items = OrderItem.where(:product_id => @user.products)
    if '/sold' == request.env['PATH_INFO']
      @order_items_orders = @order_items.map { |item| item.order_id }
      @orders = Order.where(id: @order_items_orders)
    else
      @orders = Order.where(user_id: @user.id)
    end
    @total = orders_revenue
    @statuses = ["all orders", "paid", "pending", "complete", "cancelled"]
    @status = params[:status] if params[:status]
    params[:status] == "all orders" || params[:status].nil? ? @display_orders = @orders : @display_orders = orders_by_status(params[:status])
  end

  def orders_revenue
    @orders.each.reduce(0) { |sum, order| order.order_items.reduce(0) { |sum, item| price_by_quantity(item) }  }
  end

  def orders_by_status(status)
    @orders.map { |order| order if order.status == status }
  end

  def show
    @user = User.find(session[:user_id])
    if '/sold' == request.env['PATH_INFO']
      @order = Order.find(params[:order_id])
      @order_items = OrderItem.where(:product_id => @user.products)
    else
      @order = Order.find(params[:id])
      @order_items = OrderItem.where(:order_id => @order.id)
    end
  end

  def new
    @products = Product.where(deleted: false, retired: false).where("inventory > 0")
    @order = Order.new
    @cart_items = CartItem.all.order(id: :desc) # temp - CartItem.session_id(session[:id])
    @subtotal = @cart_items.map { |item| item.quantity * item.product.price }.reduce(:+)
  end

  def create
    @cart_items = CartItem.all.order(id: :desc) # temp - CartItem.session_id(session[:id])
    @user_id = 3 # temp -session[:user_id] if session[:user_id]
    @billing_id = 1 # temp - params[:billing_id]
    @order_number = order_number
    @order = Order.new(status: "pending", confirmation_date: Time.now, order_number: @order_number, billing_id: @billing_id, user_id: @user_id)
    if @order.save
      @cart_items.each do |item|
        @order_item = OrderItem.new(quantity: item.quantity, name: item.product.name, price: item.product.price*item.quantity, status: "pending", order_id: @order.id, product_id: item.product.id)
        @order_item.save
        item.destroy
        @order_item.product.update(inventory: @order_item.product.inventory - @order_item.quantity)
      end
      redirect_to order_path(@order.id)
    else
      render :new
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
end
