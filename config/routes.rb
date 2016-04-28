Rails.application.routes.draw do
  devise_for :users
resources :goals do
  resources :tracks
end
get 'goals/:id'=> 'goals#progress'
resources :users

root 'goals#index'
end
