class Movie < ApplicationRecord
  validates :title, :description, :movie_length, :director, :rating, presence: true
  belongs_to :user
  has_many :reviews
  has_attached_file :image, styles: { medium: "480x640#", thumb: "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def build_movie(tmdb_movie, director, user_id, length = "0h - update")
    self.title = tmdb_movie[:title]
    self.description = tmdb_movie[:description]
    self.director = director
    self.image = URI.parse(tmdb_movie[:image]).open
    self.rating = "PG - update"
    self.movie_length = length
    self.user_id = user_id
  end
end
