class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :quantity,   presence: true, numericality: { greater_than: 0 }
  validates :name,       presence: true
  validates :price,      presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status,     presence: true
  validates :order_id,   presence: true
  validates :product_id, presence: true

end
