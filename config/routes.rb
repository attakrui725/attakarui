Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :users, only: [:edit, :update]
  resources :events, only: [:new, :create]

end
