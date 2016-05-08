class User < ActiveRecord::Base
  has_many :cart_items

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

end
