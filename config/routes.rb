Rails.application.routes.draw do
  get 'contact' => 'contact#index', as: 'contact' 
  get 'about' => 'about#index', as: 'about'

  resources :products
 
  root to: 'products#index'
end
