# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_scope :user do
    # get "/some/route" => "some_devise_controller"
    delete 'users/:user_id/content_groups/:id', to: 'users#remove_content_group', as: 'remove_content_group'
  end

  resources :content_groups
  get 'events/index'
  get 'events/destroy'
  get 'visits/index'
  resources :titles
  draw :madmin
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  get 'favorite_titles', to: 'titles#favorite_titles'
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'

    namespace :madmin do
      resources :impersonates do
        post :impersonate, on: :member
        post :stop_impersonating, on: :collection
      end
    end
  end

  resources :visits
  resources :events

  authenticated :user do
    root 'titles#favorite_titles', as: :authenticated_root
  end

  unauthenticated do
    root 'home#index', as: :unauthenticated_root
  end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
