Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"

  get 'studentdashboard', to: 'pages#studentdashboard'
  get 'artistdashboard', to: 'pages#artistdashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :participations, only: [:create]
    resources :course_reviews, only: [:create]
    resources :lectures
  end
  resources :users, only: [:show, :edit, :update]
end
