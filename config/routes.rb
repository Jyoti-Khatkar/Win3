Rails.application.routes.draw do
  get 'likes/create'
  get 'comments/new'
  get 'comments/create'
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/create'
  get 'users/index'
  get 'users/show'
  devise_for :users
  root to: "home#index"

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
