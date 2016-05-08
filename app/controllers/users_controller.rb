class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @cart_items = CartItem.find_by(session_id: session[:session_id])
    @user = User.new(user_create_params[:user])
    if @user.save
      session[:user_id] = @user.id
      unless @cart_items.nil?
        @cart_items.each do |item|
          item.update(user_id: @user.id) if item @user_id.nil?
        end
      end
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_create_params
    params.permit(user: [:username, :email, :password, :password_confirmation,:photo_url, :biography, :merchant])
  end
end
