Rails.application.routes.draw do
  devise_for :users

  resources :movies do
    resources :reviews, except: [:show, :index]
  end
  get 'user_movies', to: 'movies#user_movies'
  get 'tmdb_movies', to: 'movies#tmdb'
  post 'tmdb_movies', to: 'movies#tmdb'

  root 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
