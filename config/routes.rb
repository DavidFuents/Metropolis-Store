Rails.application.routes.draw do
  root :to => 'customer_sessions#index'
 
  namespace :admin do
    resources :users, only: [:new, :create]

    get 'dashboard', to: 'sessions#dashboard'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'logout', to: 'sessions#delete'
  end
  
  resources :collections, except: [:index] do 
    resources :products, except: [:index]
  end
  
  resources :categories, except: [:index] do 
    resources :products, only: [:show]
  end  

  get '/', to: 'customer_sessions#index'
end
