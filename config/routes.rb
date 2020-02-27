Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :posts
  resources :comments
  resources :likes, only: [:create, :destroy]
  resources :friendships
  resources :users , only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do

    root 'posts#index'
  
  end


  devise_scope :user do

    root to: 'static_pages#index'

    delete 'sign_out', :to => 'devise/sessions#destroy'
  
  end
end