Rails.application.routes.draw do
  root 'pages#home'
  
  get '/home', to:'pages#home'
 # get '/journeys', to: 'journeys#index' 
 # get '/journeys/new', to: 'journeys#new', as: 'new_journey'
 # post '/journeys', to: 'journeys#create'
 # get '/journeys/:id/edit', to:'journeys#edit', as: 'edit_journey'
 # patch '/journeys/:id', to:'journeys#update'
 # get '/journeys/:id', to:'journeys#show', as:'journey'
 # delete '/journeys/:id', to:'journeys#destroy'

  resources :journeys
end