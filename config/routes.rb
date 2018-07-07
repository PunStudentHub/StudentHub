Rails.application.routes.draw do
  get 'users/new'
  get '/help', to: 'pages#help'
  get '/contact', to: 'pages#contact'
  get '/home', to: 'pages#home'
  get 'pages/home'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
