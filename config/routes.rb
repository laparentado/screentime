Rails.application.routes.draw do
  get 'watched_shows/show'
  get 'watched_shows/edit'
  devise_for :users
  root "searches#index"
  resources :watcheds
  resources :watched_shows
  post "assign" => "watcheds#assign"
  post "shown" => "watcheds#shown"
end
