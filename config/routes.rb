Rails.application.routes.draw do
  get 'users/new'
  get '/help', to: 'pages#help'
  get '/contact', to: 'pages#contact'
  get '/home', to: 'pages#home'
  get '/signup', to: 'users#new'
  get 'pages/home'
  root 'pages#home'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
