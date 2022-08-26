Rails.application.routes.draw do
  # resources :reservations, only: [:index, :create, :destroy]
  resources :reservations
  resources :doctors
  resources :users

  post 'authenticate', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
