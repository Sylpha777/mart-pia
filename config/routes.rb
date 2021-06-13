Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  get 'guides', to: 'toppages#guides'
  
  get 'customers/login', to: 'sessions#new'
  post 'customers/login', to: 'sessions#create'
  delete 'customers/logout', to: 'sessions#destroy'
  
  resources :customers, only: [:show, :new, :create, :edit, :update]
  
  resources :stores, only: [:index, :show, :new, :create]
  
  resources :categories, only: [:show, :new, :create]
  
  resources :items, only: [:show, :new, :create]
  
  resources :contacts, only: [:new, :create]
  
  post 'add_item', to: 'carts#add_item'
  post 'update_item', to: 'carts#update_item'
  delete 'delete_item', to: 'carts#delete_item'
  
  resources :carts, only: [:show]
  
  delete 'destroy_cart', to: 'carts#destroy'
  
  get 'carts/:id/receive', to: 'carts#receive'
  post 'carts/:id/receive', to: 'carts#add_receive'
  get 'carts/:id/payment', to: 'carts#payment'
  post 'carts/:id/payment', to: 'carts#add_payment'
  get 'carts/:id/confirm', to: 'carts#confirm'
  post 'carts/:id/confirm', to: 'carts#cart_confirmed'
  get 'carts/:id/complete', to: 'carts#complete'
  
  get 'customers/:id/ordered', to: 'customers#ordered'
  get 'carts/:id/ordered', to: 'carts#ordered'
  
end
