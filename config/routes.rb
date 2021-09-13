Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'likes/create'
  get 'comments/new'
  get 'comments/create'

  get 'users/index'
  get 'users/show'
  devise_for :users
  root to: "home#index"

  resources :posts do
    collection do
      post :addcomment
    end
  end

  resources :friendships do
    collection do
      get :add_friend
      get :view
      post :accept_decline
      get  :friendlist
    
    end
  end

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
