class HomeController < ApplicationController

  def index
    @products = Product.all  #custom feature product logic crap
  end

  def destroy

  end
end
