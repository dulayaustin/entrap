Rails.application.routes.draw do
  get 'contact' => 'contact#index', as: 'contact' 
  get 'about' => 'about#index', as: 'about'

  resources :products do
    collection do
      get 'category/:name' => 'products#category', as: 'category'
    end
  end
 
  root to: 'products#index'
end
