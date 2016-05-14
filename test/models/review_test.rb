require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  test "in order to create a review a rating must be present" do
    review = reviews(:review1)
    assert_equal true, review.save
  end

end
