class User < ActiveRecord::Base
  has_many :cart_items

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  def self.log_in(email, password)
    somebody = User.find_by(email: email.downcase)
    somebody && somebody.authenticate(password)
  end
end
