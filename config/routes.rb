Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'profile', to: 'profile#show'
end
