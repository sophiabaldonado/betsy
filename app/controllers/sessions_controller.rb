class SessionsController < ApplicationController
  # #create signs in a user by finding the id in User model and assigning session[:user_id]
  # use keep_cart_items

  # #destroy signs out a user by destroying the sessions[:user_id]

  def new
  end

  def create
    user = User.log_in(params[:session][:email], params[:session][:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end


end
