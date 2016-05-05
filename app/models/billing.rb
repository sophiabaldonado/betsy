class Billing < ActiveRecord::Base
  belongs_to :user
  has_many :orders


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cc, uniqueness: true, length: { is: 16 }
end
