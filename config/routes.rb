Borges::Application.routes.draw do
  resources :publishers


  resources :customers


  resources :distributors


  resources :invoice_line_items

  resources :invoices


  resources :purchase_order_line_items


  resources :purchase_orders do 
    get :autocomplete_distributor_name, :on => :collection
  end


  resources :copies


  resources :editions


  resources :contributions do 
    get :autocomplete_author_full_name, :on => :collection
  end


  resources :titles do 
    get :autocomplete_publisher_name, :on => :collection
  end


  resources :authors


  authenticated :user do
    root :to => 'home#index'
  end
  match 'frontpage', :to=>'home#frontpage'
  match 'interior', :to=>'home#interior'
  root :to => "home#index"
  devise_for :users
  resources :users
end