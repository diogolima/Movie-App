module TmdbHelper

  def tmdb_movie_build(tmdb_movie)
    {
      id: tmdb_movie.id,
      original_title: tmdb_movie.original_title,
      title: tmdb_movie.title,
      original_language: tmdb_movie.original_language,
      vote_count: tmdb_movie.vote_count,
      vote_average: tmdb_movie.vote_average,
      release_date: tmdb_movie.release_date,
      description: tmdb_movie.overview,
      image: "http://image.tmdb.org/t/p/w150_and_h225_bestv2#{tmdb_movie.poster_path}",
    }
  end

  def tmdb_director(movie_id)
    Tmdb::Movie.director(movie_id).first.name
  end

  def tmdb_runtime(movie)
    (movie.runtime/60).to_s+'h '+(movie.runtime%60).to_s+'min'
  end

  def tmdb_request_movie(movie_id)
    Tmdb::Movie.detail(movie_id)
  end

  def tmdb_search(title)
    Tmdb::Search.movie(title)
  end
end
