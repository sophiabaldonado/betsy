class ProductsController < ApplicationController

  def index
    @products = Product.where(deleted: false, retired: false).order(name: :asc)
  end

  def show
    @product = Product.find(params[:id]) || Product.find(@product.id)
    @cart_items = CartItem.new
  end

  def create_cart
    @cart_items = CartItem.new
    @product = Product.find(params[:id])
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
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
