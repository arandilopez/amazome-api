Rails.application.routes.draw do
  post '/login', to: 'user_token#create'
  resources :users do
    collection do
      get 'current'
    end
  end
  resources :products
  resources :wish_lists do
  end
end
