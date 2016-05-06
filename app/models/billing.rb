class Billing < ActiveRecord::Base
  belongs_to :user
  has_many :orders


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cc, uniqueness: true, length: { is: 16 }
  validates :cvv, presence: true, length: { is: 3 }
  #validates :email, presence: true
  validates :billing_zip, presence: true, length: { is: 5 }
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { is: 5 }
  validates :user_id, presence: true
end
