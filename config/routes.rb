Rails.application.routes.draw do
  root 'application#index'

  resources :subreddits
  resources :users

end
