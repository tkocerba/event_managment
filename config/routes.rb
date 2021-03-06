Rails.application.routes.draw do
  root to: 'pages#index'

  resources :sessions
  resources :users
  
  resources :categories do 
    resources :events, expect: [:index]  
  end

  resources :pages, only: [:index] do 
    collection { get 'about' }
  end
end
