require 'test_helper'

class ReviewControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @movie_test = movies(:one)
    @review_test = reviews(:one)
    sign_in_for(@movie_test)
  end

  test "should get new" do
    get new_movie_review_url(@movie_test.id)
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post movie_reviews_path(@movie_test.id), params: {review: { comment: @review_test.comment, rating: @review_test.rating }}
    end
    assert_redirected_to @movie_test
  end

  test "should not create review - no rating" do
    assert_difference('Review.count', 0) do
      post movie_reviews_path(@movie_test.id), params: {review: { comment: @review_test.comment }}
    end
  end

  test "should not create review - no comment" do
    assert_difference('Review.count', 0) do
      post movie_reviews_path(@movie_test.id), params: {review: { rating: @review_test.rating }}
    end
  end

end
