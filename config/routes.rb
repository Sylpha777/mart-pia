Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  resources :customers, only: [:show, :new, :create, :edit, :update]
  
end
