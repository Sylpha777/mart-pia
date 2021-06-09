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
  
end
