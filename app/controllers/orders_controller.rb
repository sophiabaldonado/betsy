class OrdersController < ApplicationController

  def index
    @orders = Order.all # temp
    # @user = User.find(session[:user_id])
    # @orders = @user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @cart_items = CartItem.all # temp - CartItem.session_id(session[:id])
    @subtotal = @cart_items.map { |item| item.quantity * item.product.price }.reduce(:+)
  end

  def order_number
    rand(10000..99999)
  end

  def create
    @cart_items = CartItem.all # temp - CartItem.session_id(session[:id])
    @user_id = 3 # temp -session[:user_id] if session[:user_id]
    @billing_id = 1 # temp - params[:billing_id]
    @order_number = order_number
    @order = Order.new(status: "pending", confirmation_date: Time.now, order_number: @order_number, billing_id: @billing_id, user_id: @user_id)
    if @order.save
      @cart_items.each do |item|
        @order_item = OrderItem.new(quantity: item.quantity, name: item.product.name, price: item.product.price, status: "pending", order_id: @order.id, product_id: item.product.id)
        @order_item.save
      end
      redirect_to order_path(@order.id)
    else
      render :new
    end
  end

  private
  # def create_order_params
  #   params.permit(order_item: [: ])
  # end
end
