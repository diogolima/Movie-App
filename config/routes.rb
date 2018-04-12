Rails.application.routes.draw do
  devise_for :users

  resources :movies do
    resources :reviews, except: [:show, :index]
  end
  get 'user_movies', to: 'movies#user_movies'
  match 'tmdb_movies', to: 'movies#tmdb', via: [:get, :post]

  root 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
