Rails.application.routes.draw do
  get 'carts/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#index'
  resources :products
  resources :order_details
  resource :carts, only:[:show]

end
