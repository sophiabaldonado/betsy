class BillingsController < ApplicationController

  def index
  end

  def show
  end

  def new
    if current_user
      @billing = Billing.find_by(user_id: session[:user_id])
      unless @billing
        @billing = Billing.new
      end
    else
      @billing = Billing.new
    end
    if current_user
      @user = User.find(session[:user_id])
    else
      @user = User.new
    end
  end

  def create
    @billing = Billing.new(billing_params[:billing])
  end

  def update

  end
end

private
  def billing_params
    params.permit(billing: [:first_name, :last_name, :cc, :cvv, :expiration_date, :email, :billing_zip, :address, :address2, :city, :state, :zip, :user_id])

  end
