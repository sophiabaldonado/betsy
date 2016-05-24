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
      @orders.each do |x|
        if Time.now.to_i > (x.updated_at.to_i + 172800)
          x.update(:status => "paid")
        end
      end
      params[:status] == "all orders" || params[:status].nil? ? @display_orders = @orders : @display_orders = orders_by_status(@orders, params[:status])
      @total = all_orders_revenue(@display_orders)
      @statuses = ["all orders", "paid", "pending", "complete", "cancelled"]
      @status = params[:status] if params[:status]

    else
      redirect_to login_path
    end
  end

  def show
    #if they're a merchant:
    if current_user && "/users/#{current_user.id}/sold/#{params[:id]}" == request.env['PATH_INFO']
      @order = Order.find(params[:id])
      #@user = User.find(session[:user_id])
      @order_items = OrderItem.where(:product_id => @user.products)
    elsif current_user.nil? # if they're a customer
      @order = Order.find(params[:order_id])
      @order_items = OrderItem.where(:order_id => @order.id)

    else # if they're a customer
      @order = Order.find(params[:user_id])
      # if current_user
      #   @user = User.find(session[:user_id])
      # end
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
    @cart_items.empty?? (@subtotal = 0) : (@subtotal = @cart_items.map { |item| item.quantity * item.product.price }.reduce(:+))
  end

  def get_estimate()
    @zip = params[:zip]
    @number_items = @cart_items.map { |item| item.quantity}.reduce(:+)
    @post = "HTTParty.post(http://localhost3000/v1/zip=#{zip}&items=#{number_items}"
    @estimate = "HTTParty.get(http://localhost3000/v1/zip=#{zip}&items=#{number_items}"
    render :get_estimate
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
      @order = Order.new(status: "pending", total: total_order_revenue(@cart_items), confirmation_date: Time.now, order_number: @order_number, billing_id: @billing_id, user_id: @user_id)
      if @order.save
        @cart_items.each do |item|
          @order_item = OrderItem.new(quantity: item.quantity, name: item.product.name, price: item.product.price*item.quantity, status: "pending", order_id: @order.id, product_id: item.product.id)
          @order_item.save
          item.destroy
          @order_item.product.update(inventory: @order_item.product.inventory - @order_item.quantity)
        end
        if current_user
          render :get_estimate
          # redirect_to user_order_path(current_user.id, @order.id)
        else
          render :get_estimate
          # redirect_to checkout_confirmation_path(@order.id)
        end
      else

        render :get_estimate
      end
    else

        render :get_estimate
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
    params.permit(billing: [:first_name, :last_name, :cc, :cvv, :expiration_date, :email, :billing_zip, :address, :address2, :city, :state, :zip, :user_id])
  end
end
