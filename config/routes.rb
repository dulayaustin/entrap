Rails.application.routes.draw do
  get 'contact' => 'contact#index', as: 'contact' 
  get 'about' => 'about#index', as: 'about'

  resources :products do
    collection do
      get 'sub_category/:id' => 'products#sub_category', as: 'sub_category'
    end
  end
 
  root to: 'products#index'
end
