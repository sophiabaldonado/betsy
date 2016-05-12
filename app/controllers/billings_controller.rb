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
    @user = User.find(session[:user_id])
  end

  def create
    @billing = Billing.new(billing_params[:billing])
  end

  def update

  end
end

private
  def billing_params
    params.permit(billing: [:first_name, :last_name, :cc, :cvv, :email, :billing_zip, :address1, :city, :state, :zip, :user_id])

  end
