Rails.application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  resources :products do
    collection do
      get 'category/:name' => 'products#category', as: 'category'
      get 'sub_category/:name' => 'products#sub_category', as: 'sub_category'
    end
  end

  resources :about, only: [:index, :update]
  resources :contact, only: [:index, :update]
  resources :fight_teams, only: [:index, :create, :update, :destroy]
 
  root to: 'products#index'
end
