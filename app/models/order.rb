class Order < ActiveRecord::Base
  belongs_to :user
  has_one :billing
  has_many :order_items

  # validates :status, presence: true
  # validates :confirmation_date, presence: true
  # validates :billing_id, presence: true
  # validates :order_number, presence: true, uniqueness: true

  def orders_by_status(orders, status)
    orders.select { |order| order.order_number if order.status == status }
  end

  def billing
    Billing.find(self.billing_id)
  end

end
