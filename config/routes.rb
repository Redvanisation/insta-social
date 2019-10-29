Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users , only: [:show]

  resources :posts
  resources :comments
  resources :likes, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
