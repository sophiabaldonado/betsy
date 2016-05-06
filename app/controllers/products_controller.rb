class ProductsController < ApplicationController

  def index
    @products = Product.all.order(name: :asc)
  end

  def show
    @product = Product.find(params[:id])
  end

  def categories

  end
end
