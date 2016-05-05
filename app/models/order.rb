class Order < ActiveRecord::Base
  belongs_to :user
  # I don't think we set up the schema right for the billing/orders relationship
  has_one :billing
end
