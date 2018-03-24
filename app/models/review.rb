class Review < ApplicationRecord
  validates :rating, :comment, presence: true
  belongs_to :user
  belongs_to :movie
end
