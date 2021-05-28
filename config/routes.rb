Rails.application.routes.draw do

  root 'pages#home'

  devise_for :helpers, controllers: { registrations: 'helpers/registrations' }
  devise_for :clients, controllers: { registrations: 'clients/registrations' }
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :locations

  get 'profile', to: 'profile#show'
end
