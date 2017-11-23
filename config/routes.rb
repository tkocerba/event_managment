Rails.application.routes.draw do
  root to: 'pages#index'

  resources :categories

  resources :pages, only: [:index] do 
    collection { get 'about' }
  end
end
