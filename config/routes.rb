Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  mount Attachinary::Engine => "/attachinary"

  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :participations, only: [:create]
  end
  resources :users, only: [:show, :edit, :update]
end
