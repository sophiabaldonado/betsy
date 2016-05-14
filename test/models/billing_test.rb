require 'test_helper'

class BillingTest < ActiveSupport::TestCase


  test "can create a valid billing" do
    billing = billings(:billing1)
    assert true, billing.save
  end
  #
  # test "Test that address is required" do
  #   invalid_params = valid_params.clone
  #   invalid_params[:address] = nil
  #   billing = Billing.new(invalid_params)
  #   billing.valid?
  #   # puts '!!!!!!!!!!!!'
  #   # puts billing.errors.full_messages
  #   # puts '!!!!!!!!!!!!'
  #   assert billing.errors.include?(:address)
  # end
  #
  # test "Test that email is required" do
  #   invalid_params = valid_params.clone
  #   invalid_params[:email] = nil
  #   billing = Billing.new(invalid_params)
  #   billing.valid?
  #   assert billing.errors.include?(:email)
  # end

end
