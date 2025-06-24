Rails.application.routes.draw do
  get "animes/new"
  get "animes/create"
  root "home#index"
  get  'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :users, only: [:new, :create]
  
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :animes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  
  get "up" => "rails/health#show", as: :rails_health_check

end
