Rails.application.routes.draw do
  root :to => 'collections#index'
 
  namespace :admin do
    resources :users, only: [:new, :create]

    get 'dashboard', to: 'sessions#dashboard'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'logout', to: 'sessions#delete'
  end

  resources :collections do 
    resources :categories
  end
end
