Rails.application.routes.draw do
  devise_for :users
  root to: "events#top"
  resources :users, only: [:edit, :update]
  resources :events, only: [:index, :new, :create, :edit,
  :update, :destroy] do
    get 'edit_template'
    get 'new_template', on: :collection
  end

end
