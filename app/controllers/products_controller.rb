class ProductsController < ApplicationController

  def index
    @products = Product.where(deleted: false, retired: false).order(name: :asc)
  end

  def show
    @product = Product.find(params[:id])
    @cart_items = CartItem.new
    @cart_items = CartItem.all
  end

  def create_cart
    @cart_items = CartItem.new(cart_params[:cart_item])
    @product = Product.find(params[:id]) || Product.find(@product.id)
    raise
    if @cart_items.save
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
