class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_movie, :authenticate_user!
  before_action :review_owner, only: [:destroy]

  def new
    @review = Review.new
  end

  # def edit
  # end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.movie_id = @movie.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to @movie, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
      end
    end
  end
  #
  # def update
  #   respond_to do |format|
  #     if @review.update(review_params)
  #       format.html { redirect_to @review, notice: 'Review was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @review }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @review.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    # byebug
  #   @review.destroy
  #   respond_to do |format|
  #     format.html { redirect_to review_url, notice: 'Review was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def review_owner
    owner(User.find(@review.user_id), movie_url(@movie.id), "You can't delete this. You are not the owner.")
  end

end
