Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :comments, only: [:index, :create, :update, :destroy]
  resources :users, only: [:show]
  resources :posts
  root "home#index"
end