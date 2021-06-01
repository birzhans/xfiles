Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :locations
  resources :skills
  resources :aides

  resources :conversations, only: [:index, :show]
  resources :messages, only: [:new, :create]

  get 'profile', to: 'users#profile'

  post 'favourite_aide', to: 'clients#favourite_aide'
  get  'favourites',     to: 'clients#favourites'
end
