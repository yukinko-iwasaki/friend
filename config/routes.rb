Rails.application.routes.draw do
  devise_for :users
  resources :tops
get '/groups/:group_id/users/:id' =>'groups#shonin'
post '/groups/:group_id/users/:id'=>'groups#update'

resources :groups do
  resources :users
end


resources :users do
resources :goals do
  resources :tracks
  resources :comments

end
end

get '/groups/:group_id/goals/new' => 'groups#mokuhyo'
post '/groups/:group_id/goals/new' => 'groups#create_group'

get '/tops/index/about' => 'tops#about'
post '/users/:id' => 'tracks#create'

post '/users/:user_id/goals/new' =>'goals#createcheck'
post '/tops/:id' => 'tops#commentcreate'
post '/goals/:id' => 'goals#commentcreate'

root 'tops#index'
end
