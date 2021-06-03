Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users do
    collection do
      get 'profile'
    end
  end

  resources :requests do
    member do
      get 'change_status'
    end
  end
  resources :locations
  resources :skills
  resources :aides

  resources :conversations, only: [:index, :show]
  resources :messages, only: [:new, :create]

  post 'favourite_aide', to: 'clients#favourite_aide'
  get  'favourites',     to: 'clients#favourites'
end
