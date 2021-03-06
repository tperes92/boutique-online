Rails.application.routes.draw do

  get 'users/show'
   root 'items#index' 
   get '/cart', to: 'cart#show' 

	devise_for :users
	resources :items
  resources :carts
  resources :cart_items
  resources :orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
