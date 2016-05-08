class ProductsController < ApplicationController

  def index
    @products = Product.where(deleted: false, retired: false).order(name: :asc)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    @cart_item = CartItem.all
  end

  def create_cart
    @cart_item = CartItem.new(cart_params)
    @product = Product.find(params[:id]) || Product.find(@product.id)
    if @cart_item.save
      @cart_item.update(session_id: session[:session_id])
      @cart_item.update(user_id: session[:user_id]) if session[:user_id]
      redirect_to product_path(@product.id), :notice => 'Products added to cart.'
    else
      render :show
    end
  end

  def update_cart
  end

  def categories

  end

  private

  def cart_params
    params.permit(:quantity, :product_id)

  end
end
