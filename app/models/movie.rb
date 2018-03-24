class Movie < ApplicationRecord
  validates :title, :description, :movie_length, :director, :rating, presence: true
  belongs_to :user
  has_many :reviews
  has_attached_file :image, styles: { medium: "480x640#", thumb: "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
