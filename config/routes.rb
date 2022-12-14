Rails.application.routes.draw do
  
  get '/', to: 'lakes#index'
  get '/lakes', to: 'lakes#index'
  get '/lakes/new', to: 'lakes#new'
  post '/lakes', to: 'lakes#create' 
  get '/lakes/:id/edit', to: 'lakes#edit'
  patch '/lakes/:id', to: 'lakes#update'
  get '/lakes/:id', to: 'lakes#show'
  delete '/lakes', to: 'lakes#destroy'
  delete '/lakes/:id/', to: 'lakes#destroy'
  
  
  get '/lakes/:id/fishes/new', to: 'lakes_fishes#new'
  get '/lakes/:id/fishes', to: 'lakes_fishes#index'
  post 'lakes/:id/fishes', to: 'lakes_fishes#create'

  # get '/lakes/:id/fishes/sort', to: 'lakes_fishes#sort'
  
  
  get '/fishes', to: 'fishes#index'
  get '/fishes/:id/edit', to: 'fishes#edit'
  patch '/fishes/:id', to: 'fishes#update'
  get '/fishes/:id', to: 'fishes#show'
  delete '/fishes', to: 'fishes#destroy'
  delete '/fishes/:id', to: "fishes#destroy"

end
