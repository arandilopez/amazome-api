Rails.application.routes.draw do
  post '/sign_up', to: 'register#create', as: :register
  post '/login', to: 'user_token#create', as: :login
  resources :users do
    collection do
      get 'current'
    end
  end
  resources :products
  resources :wish_lists do
    resources :products, controller: 'wish_list_products', only: %i{index create destroy}
  end
  resources :cart, only: %i{index create destroy}
end
