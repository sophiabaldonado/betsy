class Review < ActiveRecord::Base
  belongs_to :user

  belongs_to :product

  #validations
  validates :comment, presence: true, length: { in: 1..200 }
  validates :rating, presence: true
  validates :product_id, presence: true
end
