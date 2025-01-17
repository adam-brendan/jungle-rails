Rails.application.routes.draw do

  root to: 'products#index'

  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create, :destroy]
  end

  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  resources :users


  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, except: [:edit, :update, :show]
  end

  get "users/new" => "users#new"
  post "users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  post "/products/:product_id/reviews" => "reviews#create"

end
