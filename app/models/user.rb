class User < ActiveRecord::Base

  has_many :cart_items

  has_many :reviews
  has_one :billing

  has_many :products


  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  def self.log_in(email, password)
    somebody = User.find_by(email: email.downcase)
    somebody && somebody.authenticate(password)
  end

  def profile_pic
    picture = self.photo_url
    if picture == nil || picture == ""
      "http://images.cdn4.stockunlimited.net/clipart/add-user-icon_1598354.jpg"
    else
      picture
    end
  end

  def current_user?(current_user)
    return false if current_user == nil
    current_user.id == self.id ? true : false
  end

end
