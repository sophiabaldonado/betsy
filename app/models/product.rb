class Product < ActiveRecord::Base
  #joined table
  has_many :product_categories
  has_many :categories, :through => :product_categories
  #other associations
  belongs_to :order_item
  belongs_to :user
  has_many :reviews
  #validations
  validates :name, presence: true, uniqueness: true, length: { in: 1..30 }
  validates :inventory, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def in_stock?
    self.inventory >= 0
  end
end
