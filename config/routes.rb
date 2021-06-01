Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :locations

  resources :conversations, only: [:index, :show]
  resources :messages, only: [:create]

  get 'profile', to: 'users#profile'
end
