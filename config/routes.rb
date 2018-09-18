Rails.application.routes.draw do
  get 'blog/new'
  get 'blog/create'
  get 'blog/edit'
  get 'blog/update'
  get 'blog/destroy'
  root 'pages#home'
  get '/help', to: 'pages#help'
  get '/contact', to: 'pages#contact'
  get '/home', to: 'pages#home'
  get '/staff', to: 'pages#staff'
  get '/plc', to: 'plc#index'
  delete '/logout', to: 'sessions#destroy'
  get '/filter/get', to: 'filters#get', as: 'get_filter'
  post '/filter/update', to: 'filters#update', as: 'update_filter'
  #google
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post '/event/approve', to: 'events#approve', as: 'approve_event'
  post '/event/rsvp', to: 'events#rsvp', as: 'rsvp_event'
  post '/event/unrsvp', to: 'events#unrsvp', as: 'unrsvp_event'

  resources :users, only: [:show, :index, :destroy]
  resources :events
  resources :announcements
  resources :blog
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
