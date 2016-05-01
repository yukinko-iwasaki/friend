Rails.application.routes.draw do
  devise_for :users
  resources :tops

resources :users do
resources :goals do
  resources :tracks
  resources :comments

end
end




post '/goals/:id' => 'goals#commentcreate'

root 'tops#index'
end
