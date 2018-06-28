Rails.application.routes.draw do

  devise_for :users
  root "searches#index"
  resources :watcheds
  resources :watched_shows
  resources :favorites
  post "assign" => "watcheds#assign"
  post "shown" => "watcheds#shown"
  post "favorite" => "watcheds#favorite"
end
