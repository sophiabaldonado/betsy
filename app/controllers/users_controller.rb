class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :show]
  def new
    @user = User.new
  end

  def create
    @cart_items = CartItem.where(session_id: session[:session_id])
    @user = User.new(user_create_params[:user])
    if @user.save
      session[:user_id] = @user.id
      keep_cart_items(@cart_items)
      redirect_to user_path(@user)
    else
      @user = User.new(user_create_params[:user])
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
    @user = User.find(params[:id])
    render :new
  end

  def update
    user = User.find(params[:id])
    user.update(user_create_params[:user])
    redirect_to user_path(user)
  end

  private

  def user_create_params
    params.permit(user: [:username, :email, :password, :password_confirmation,:photo_url, :biography, :merchant])
  end
end
