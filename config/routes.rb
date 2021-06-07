Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  get 'customers/login', to: 'sessions#new'
  post 'customers/login', to: 'sessions#create'
  delete 'customers/logout', to: 'sessions#destroy'
  
  resources :customers, only: [:show, :new, :create, :edit, :update]
  
end
