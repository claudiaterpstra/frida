Rails.application.routes.draw do
  get 'notifications/link_through'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
  get 'dashboard', to: 'pages#dashboard'
  get 'studentdashboard', to: 'pages#studentdashboard'
  get 'artistdashboard', to: 'pages#artistdashboard'
  get 'studio', to: 'pages#studio'
  get 'manage_courses', to: 'pages#manage_courses'
  get 'give_feedback', to: 'pages#give_feedback'
  get 'notifications/:id/link_through', to: 'notifications#link_through',
                                        as: :link_through
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :participations, only: [:create]
    resources :course_reviews, only: [:create]
    resources :lectures, only: [:new, :create]
    patch '/publish', to: 'courses#publish'
  end

  resources :lectures, except: [:new, :create] do
    resources :artworks, only: [:create]
  end

  resources :artworks, only: [:index, :show, :edit, :destroy] do
    resources :feedbacks, only: [:show, :create]
    patch '/feature', to: 'artworks#feature'
  end

  resources :users, only: [:show, :edit, :update]
end
