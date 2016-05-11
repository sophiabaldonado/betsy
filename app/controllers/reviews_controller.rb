class ReviewsController < ApplicationController
  def index
  end

  def show
    @review = Review.all where(params[:product_id])
    redirect_to product_path(@review.product_id)
  end

  def new
    @review = Review.new
    @product = Product.find(params[:product_id])

  end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params[:review])
    if @review.save!
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])  #s?
    #redirect_to 'products/show'
  end

  def update
  end

  def delete
  end
end

private
  def review_params
    params.permit(review: [:comment, :rating, :product_id, :user_id])

  end
