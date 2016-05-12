class Order < ActiveRecord::Base
  belongs_to :user
  has_one :billing
  has_many :order_items

  validates :status, presence: true
  validates :confirmation_date, presence: true
  validates :billing_id, presence: true
  validates :order_number, presence: true, uniqueness: true

  def orders_revenue
    @orders.each.reduce(0) { |sum, order| order.order_items.reduce(0) { |sum, item| price_by_quantity(item) }  }
  end

  def orders_by_status(status)
    @orders.map { |order| order.order_number if order.status == status }
  end

end
