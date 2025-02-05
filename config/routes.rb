Rails.application.routes.draw do
  root 'application#index'

  resources :subreddits
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, except: [:new]

  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
