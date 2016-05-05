class Product < ActiveRecord::Base
  belongs_to :order_item
  belongs_to :user
  has_many :categories, :through => :product_categories
  has_many :reviews
  validates :name, presence: true, uniqueness: true, length: { in: 1..30 }
  validates :inventory, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
end
