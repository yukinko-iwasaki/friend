Rails.application.routes.draw do
  devise_for :users
resources :goals
resources :users
resources :tracks
  root 'goals#index'
end
