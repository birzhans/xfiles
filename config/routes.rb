Rails.application.routes.draw do
  root 'pages#home'

  devise_for :aides, controllers: { registrations: 'aides/registrations' }
  devise_for :clients, controllers: { registrations: 'clients/registrations' }

  resources :locations

  resources :clients do
    collection do
      get 'profile'
    end
  end

  resources :aides do
    collection do
      get 'profile'
    end
  end
end
