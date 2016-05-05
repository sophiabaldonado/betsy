class CartItem < ActiveRecord::Base
  has_one :product

  validates :quantity,   presence: true, numericality: { greater_than: 0 }
  validates :product_id, presence: true

end
