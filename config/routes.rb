Rails.application.routes.draw do

  devise_for :users
  resources :categories, only: :show do 
  	resources :products, controller: :category_products, only: :show do 
      post 'add', on: :member
    end
  end
  resource :cart
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'

  namespace :admin do 
  	root 'index#index'
  	resources :categories
  	resources :users
  	resources :products
    resources :orders, except: %i(new create)
  end
	root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
