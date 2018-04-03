require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @movie_test = movies(:one)
    sign_in_for(@movie_test)
  end

  test "should get index" do
    get movies_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_url
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie: { description: @movie_test.description, director: @movie_test.director, movie_length: @movie_test.movie_length, rating: @movie_test.rating, title: @movie_test.title } }
    end

    assert_redirected_to movie_url(Movie.last)
  end

  test "should show movie" do
    get movie_url(@movie_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_url(@movie_test)
    assert_response :success
  end

  test "should not get edit" do
    att_diff_user(@movie_test)
    get edit_movie_url(@movie_test)
    assert_redirected_to movies_url
  end

  test "should update movie" do
    patch movie_url(@movie_test), params: { movie: { description: @movie_test.description, director: @movie_test.director, movie_length: @movie_test.movie_length, rating: @movie_test.rating, title: @movie_test.title} }
    assert_redirected_to movie_url(@movie_test)
  end

  test "should not update movie" do
    att_diff_user(@movie_test)
    patch movie_url(@movie_test), params: { movie: { description: @movie_test.description, director: @movie_test.director, movie_length: @movie_test.movie_length, rating: @movie_test.rating, title: @movie_test.title} }
    assert_redirected_to movies_url
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete movie_url(@movie_test)
    end
    assert_redirected_to movies_url
  end

  test "should not destroy movie" do
    att_diff_user(@movie_test)
    assert_difference('Movie.count', 0) do
      delete movie_url(@movie_test)
    end
    assert_redirected_to movies_url
  end

end
