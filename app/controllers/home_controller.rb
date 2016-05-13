class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    @products = Product.all  #custom feature product logic crap
  end

  def destroy

  end
end
