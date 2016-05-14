require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product must belong to a user" do
    assert_equal products(:p_one).user_id, users(:mike).id
  end

  test "a retired product should be true" do
    prod1 = Product.find(1)
    prod1.update(retired: true)
    assert_equal prod1.retired, true
  end

  test "if photo_url is nil, product_pic method saves with default" do
    prod1 = Product.find(1)
    prod1.update(photo_url: nil)
    assert_equal prod1.product_pic, "http://www.apheresis.org/global_graphics/default-store-350x350.jpg"
  end

  test "if photo_url exists, product_pic method returns existing url" do
    prod1 = Product.find(1)
    assert_equal prod1.product_pic, "http://www.shoes.com"
  end


end
