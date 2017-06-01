Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"

  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :participations, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :users, only: [:show, :edit, :update]
end
