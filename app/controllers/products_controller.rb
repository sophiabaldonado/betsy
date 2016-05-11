class ProductsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show, :create_cart, :browse_by]

  BROWSE = ['All Products', 'Category', 'Merchant']

  def index
    @browser = BROWSE
    if params[:browse] == BROWSE[1]
      @show = Category.uniq.order(name: :asc)
    elsif params[:browse] == BROWSE[2]
      @show = User.where(merchant: true)
    else
      @show = Product.where(deleted: false, retired: false).order(name: :asc)
    end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.where(product_id: @product.id)
    @cart_item = CartItem.new
    @cart_item = CartItem.all
    #@review = Review.find_by(product_id: @product.id)

  end


  def create_cart
    @cart_item = CartItem.new(cart_params)
    @product = Product.find(params[:id]) || Product.find(@product.id)
    if @cart_item.save
      @cart_item.update(session_id: session[:session_id])
      @cart_item.update(user_id: session[:user_id])
      redirect_to product_path(@product.id), :notice => 'Products added to cart.'
    else
      render :show
    end
  end

  def browse_by

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
