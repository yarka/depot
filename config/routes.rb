Depot::Application.routes.draw do
  
  resources :line_items

  resources :carts

  resources :products
  
  get "store" => 'store#index'

  root :to => 'store#index'  
end
