require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

 setup do
   @movie = Movie.new(title: "Harry Potter", description: "Description about harry movie", movie_length: "2h36m", director: "That guy/girl", rating: "PG", user_id: 1)
 end
  test "valid movie" do
    assert @movie.valid?
  end

  test 'invalid without title' do
    @movie.title = ""
    assert_movie(:"title")
  end

  test "invalid description" do
    @movie.description = ""
    assert_movie(:"description")
  end

  test "invalid movie_length" do
    @movie.movie_length = ""
    assert_movie(:"movie_length")
  end

  test "invalid director" do
    @movie.director = ""
    assert_movie(:"director")
  end

  test "invalid rating" do
    @movie.rating = ""
    assert_movie(:"rating")
  end

  test "invalid user" do
    @movie.user_id = ""
    assert_movie(:"user")
  end

  test "all tests fails" do
    @new = Movie.new
    refute @new.valid?
    assert_not_nil @new.errors
    assert @new.errors.count == 6
  end

  def assert_movie(param)
    refute @movie.valid?
    assert_not_nil @movie.errors[param]
    assert @movie.errors[param].first == "can't be blank" || @movie.errors[param].first == "must exist"
  end
end
