Rails.application.routes.draw do
  post 'login', to: 'user_token#create'
  resources :products
  resources :users do
    collection do
      get 'current'
    end
  end
end
