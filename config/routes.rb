Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :posts
  resources :comments
  resources :likes, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
