Rails.application.routes.draw do
  post '/friendship_search', to: 'friendships#search', as: 'friendship_search'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :comments, only: [:index, :create, :update, :destroy]
  resources :friendships, only: [:index, :create, :update, :destroy]
  resources :users, only: [:show]
  resources :posts
  root "home#index"
end