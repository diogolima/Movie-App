class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :movie_owner, only: [:edit, :update, :destroy]

  def index
    if current_user != nil && check_user_id
      @movies = @search.result.where(:user_id => current_user.id)
    else
      @movies = @search.result
    end
  end

  def show
    @average = @movie.reviews.count > 0 ? @movie.reviews.average(:rating).round(2) : 0 ;
    @reviews = @movie.reviews.order('reviews.created_at DESC')
  end

  def user_movies
    respond_to do |format|
      if current_user.movies != nil && current_user.movies.count > 0
        format.html { redirect_to movies_url user_id: current_user.id }
      else
        format.html { redirect_to movies_url, notice: 'Current user doesn\'t have movies' }
      end
    end
  end

  def new
    @movie = current_user.movies.build
  end

  def edit
  end

  def create
    @movie = current_user.movies.build(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image)
    end

    def movie_owner
      owner(@movie.user, movies_url, "You can't edit this. You are not the owner.")
    end

    def check_user_id
      user_id = params[:user_id].to_i
      user_id.to_s == params[:user_id] && user_id == current_user.id
    end
end
