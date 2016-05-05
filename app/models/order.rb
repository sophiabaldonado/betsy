class Order < ActiveRecord::Base
  belongs_to :user
  has_one :billing
  has_many :order_items

  validates :status, presence: true
  validates :confirmation_date, presence: true
  validates :billing_id, presence: true
  validates :order_number, presence: true, uniqueness: true

end
