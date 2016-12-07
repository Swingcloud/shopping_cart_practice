Rails.application.routes.draw do

  devise_for :users
  resources :categories, only: :show do 
  	resources :products, controller: :category_products, only: :show
  end

  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
	root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
