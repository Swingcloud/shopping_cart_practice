Rails.application.routes.draw do

  devise_for :users
  resources :categories, only: :show do 
  	resources :products, controller: :category_products, only: :show do 
      post 'add', on: :member
      resources :comments, controller: 'product_comments', only: :create
    end
    resources :comments, controller: 'category_comments', only: :create
  end
  resource :cart
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'

  namespace :admin do 
  	root 'index#index'
  	resources :categories
  	resources :users
  	resources :products do 
      post 'export', on: :collection
    end
    resources :orders, except: %i(new create)
  end
  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
	root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
