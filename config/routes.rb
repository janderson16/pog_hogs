Rails.application.routes.draw do
  root to: 'items#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users, only: [:new, :create]
  get '/dashboard', to: "users#show"
  
  resources :categories do
    resources :items, except: [:index]
  end

  resources :carts
  get '/cart', to: 'carts#show'

  resources :items, only: [:index]

end
