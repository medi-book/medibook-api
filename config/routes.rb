Rails.application.routes.draw do
  resources :doctors
  resources :users
  
  post 'authenticate', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
