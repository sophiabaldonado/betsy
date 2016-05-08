class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params[:user])
    if @user.save
      session[:user_id] = @user.id
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
