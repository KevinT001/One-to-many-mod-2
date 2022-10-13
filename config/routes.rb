Rails.application.routes.draw do
 
  get '/', to: 'lakes#index'
  get '/lakes', to: 'lakes#index'
  get '/lakes/new', to: 'lakes#new'
  post '/lakes', to: 'lakes#create' 
  get '/lakes/:id/edit', to: 'lakes#edit'
  patch '/lakes/:id', to: 'lakes#update'
  get '/lakes/:id', to: 'lakes#show'
  

  get '/fishes', to: 'fishes#index'
  get '/fishes/:id', to: 'fishes#show'
  get '/lakes/:id/fishes', to: 'lakes_fishes#index'
  
end
