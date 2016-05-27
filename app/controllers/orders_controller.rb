require_relative '../../lib/ShippingServiceWrapper'

class OrdersController < ApplicationController
  include OrdersHelper
  skip_before_action :require_login, only: [:new, :update_cart, :destroy, :create, :show, :shipping, :update_cart_with_shipping]

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
      @order = Order.find(session[:order_id])
      @order_items = OrderItem.where(:product_id => @user.products)
    elsif current_user.nil? # if they're a customer
      @order = Order.find(session[:order_id])
      @order_items = OrderItem.where(:order_id => @order.id)

    else # if they're a customer
      @order = Order.find(session[:order_id])
      @order_items = OrderItem.where(:order_id => @order.id)
    end
  end

  def new
    @order = Order.new(status: "pending")
    @order.save!
    session[:order_id] = @order.id
    new_helper
  end

  def create
    shipping = params["order"]["shipping_rate"].to_i
    @billing = Billing.new

    if @billing.save(validate: false)

      if current_user
        @cart_items = CartItem.all.where(user_id: session[:user_id])
      else
        @cart_items = CartItem.all.where(session_id: session[:session_id])
      end

      @user_id = session[:user_id] if session[:user_id]
      @billing_id = @billing.id
      @order_number = order_number

      @order = Order.find(session[:order_id])
      total_in_pennies = (total_order_revenue(@cart_items) * 100)
      @order.update(status: "pending", total: (total_in_pennies + shipping + (total_in_pennies * 0.1)), confirmation_date: Time.now, order_number: @order_number, billing_id: @billing_id, user_id: @user_id, shipping_rate: params["order"]["shipping_rate"])

      @rates = nil

      @cart_items.each do |item|
        @order_item = OrderItem.new(quantity: item.quantity, name: item.product.name, price: item.product.price*item.quantity, status: "pending", order_id: @order.id, product_id: item.product.id)
        @order_item.save
        item.destroy
        @order_item.product.update(inventory: @order_item.product.inventory - @order_item.quantity)
      end
    end
    render "/billings/new"
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

  def shipping
    if current_user
      @cart_items = current_user.cart_items
    else
      @cart_items = CartItem.where(session_id: session[:session_id])
    end

    #Each item to weigh a pound. Therefore, quantity = weight.
    @quantity = 0
    @cart_items.each do |item|
      @quantity += item.quantity
    end

    #Every item comes in the same box:
    @packing_info = {
      weight: "#{@quantity}",
      height: "15",
      width: "15",
      length: "15"
    }

    
    @rates = ShippingServiceWrapper.get_quote(params, @packing_info).parsed_response
    if @rates["status"] != "200"
      flash[:alert] = "Invalid shipping data, try again."
      new_helper
      # redirect_to '/checkout'
      render :new
      return
    end


    # creating array for drop down menu in view
    @rates_array = []
    @rates[0].each do |option|
      @rates_array << ["#{option[0]}: #{number_to_currency(option[1])}", option[1]]
    end
    @rates[1].each do |option|
      @rates_array << ["#{option[0]}: #{number_to_currency(option[1])}", option[1]]
    end

    new_helper
    render :new
  end

###### PRIVATE STARTS HERE!!!!!!! ######
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
