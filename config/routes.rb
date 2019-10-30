Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :posts
  resources :comments
  resources :likes, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do

    root 'users#index'
  
  end


  devise_scope :user do

    root to: 'devise/sessions#new'
  
  end
end
