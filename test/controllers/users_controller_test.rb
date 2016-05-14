require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def self.log_in(email, password)
    user = find_by(email: email)
    user && user.authenticate(password)
  end
end
