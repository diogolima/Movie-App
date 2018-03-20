class Movie < ApplicationRecord
  validates :title, :description, :movie_length, :director, :rating, presence: true
  belongs_to :user
end
