Rails.application.routes.draw do
  devise_for :users
  root "searches#index"
  
  resources :watcheds
  resources :watched_shows
  resources :favorites
  resources :want_movies
  resources :want_shows

  post "assign" => "watcheds#assign"
  post "shown" => "watcheds#shown"
  post "favorite" => "watcheds#favorite"
  post "list_movie" => "want_movies#list_movie"
  post "list_show" => "want_shows#list_show"
  post "watch_movie" => "want_movies#watch_movie"
  post "watch_show" => "want_shows#watch_show"
end
