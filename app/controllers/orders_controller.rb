class OrdersController < ApplicationController

  def index
    @orders = Orders.all
  end

  def show
    @order = Order.find(params[:id])
  end
end
