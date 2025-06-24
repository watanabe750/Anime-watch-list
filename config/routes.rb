Rails.application.routes.draw do
  get  'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :users, only: [:new, :create]
  root "users#new"
  
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

end
