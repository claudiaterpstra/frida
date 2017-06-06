Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
  get 'dashboard', to: 'pages#dashboard'
  get 'manage_courses', to: 'pages#manage_courses'

  get 'studentdashboard', to: 'pages#studentdashboard'
  get 'artistdashboard', to: 'pages#artistdashboard'
  get 'studio', to: 'pages#studio'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :participations, only: [:create]
    resources :course_reviews, only: [:create]
    resources :lectures, only: [:new, :create]
    patch '/publish', to: 'courses#publish'
  end

  resources :lectures, except: [:new, :create] do
    resources :artworks, only: [:new, :create]
  end

  resources :artworks, only: [:index, :show, :edit, :destroy] do
    resources :feedback, only: [:create]
  end

  resources :users, only: [:show, :edit, :update]
end
