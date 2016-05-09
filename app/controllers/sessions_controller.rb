class SessionsController < ApplicationController
  # #create signs in a user by finding the id in User model and assigning session[:user_id]
  # use keep_cart_items

  # #destroy signs out a user by destroying the sessions[:user_id]

  def new #renders view
  end


  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      redirect_to user_path(@user.id)
    else
      redirect_to login_path
    end
  end


  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
