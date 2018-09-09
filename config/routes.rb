Rails.application.routes.draw do
  root 'pages#home'
  get '/help', to: 'pages#help'
  get '/contact', to: 'pages#contact'
  get '/home', to: 'pages#home'
  get '/plc', to: 'plc#index'
#  get '/signup', to: 'users#new', as: 'signup'
#  post '/signup',  to: 'users#create'
#  get '/login', to: 'sessions#new'
#  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/filter/get', to: 'filters#get', as: 'get_filter'
  post '/filter/update', to: 'filters#update', as: 'update_filter'
  #google
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'


  resources :users, only: [:show, :index, :destroy]
  resources :announcements
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
