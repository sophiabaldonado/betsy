require 'httparty'
require 'json'
class OrdersController < ApplicationController
  include OrdersHelper
  skip_before_action :require_login, only: [:index, :new, :update_cart, :destroy, :create, :show, :shipping, :get_estimate]


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
    # @subtotal = params[:subtotal]

    #if they're a merchant:
    if current_user && "/users/#{current_user.id}/sold/#{params[:id]}" == request.env['PATH_INFO']
      @order = Order.find(params[:id])
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
    @carrier_type = @order.carrier_type
    @carrier_price = @order.carrier_price
    @tracking = HTTParty.get("http://shipping-traverse.herokuapp.com/v1/carriers/selected/?carrier_type=#{@carrier_type}&carrier_price=#{@carrier_price}").parsed_response
    @tracking_number = @tracking["#{@carrier_type}"]
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

  def shipping


  end

  def get_estimate
    @zip = params["/checkout/estimate"][:zip]
    @city = params["/checkout/estimate"][:city]
    @state = params["/checkout/estimate"][:state]
    if current_user
      @cart_items = CartItem.all.where(user_id: session[:user_id])
    else
      @cart_items = CartItem.all.where(session_id: session[:session_id])
    end
    @number_items = @cart_items.map { |item| item.quantity}.reduce(:+)

    @estimate = HTTParty.get("http://shipping-traverse.herokuapp.com/v1/carriers/?zip=#{@zip}&items=#{@number_items}&city=#{@city}&state=#{@state}").parsed_response
    render :get_estimate
  end

  def create

    if current_user
      @cart = Order.find_by(id: session[:user_id])
    else
      @cart = Order.all.last
    end
    @carrier_type = params["billing"]["carrier_type"]
    @carrier_price = params["billing"]["carrier_price"]
    # @subtotal = params[:subtotal]

    # :body => {
    #   "carrier_type": "#{@carrier_type}",
    #   "carrier_price": "#{@carrier_price}"
    # }.to_json,
    # :headers => {"Content-Type" => "application/json" } )

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
      @order = Order.new(status: "pending", total: total_order_revenue(@cart_items), confirmation_date: Time.now, order_number: @order_number, billing_id: @billing_id, user_id: @user_id, carrier_type: @carrier_type, carrier_price: @carrier_price)
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

        render "/billings/new"
      end
    else

        render "/billings/new"
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
