Rails.application.routes.draw do
  root to: 'items#index'

  resources :categories do
    resources :items, except: [:index]
  end

  resources :carts
  get '/cart', to: 'carts#show'

  resources :items, only: [:index]

end