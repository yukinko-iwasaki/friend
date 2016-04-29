Rails.application.routes.draw do
  devise_for :users
resources :goals do
  resources :tracks
  resources :comments
end

resources :users
post '/goals/:id' => 'goals#commentcreate'
root 'goals#index'
end
