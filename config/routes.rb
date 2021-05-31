Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users

  resources :locations
  resources :rooms
  resources :messages


end
