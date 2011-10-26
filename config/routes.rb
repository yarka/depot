Depot::Application.routes.draw do

  resources :line_items, :only => [:create]
 
  match 'cart' => 'carts#show', :via => :get
  
  resources :products
  
  get "store" => 'store#index'
  root :to => 'store#index'  

end
