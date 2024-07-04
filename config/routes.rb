Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#home'
  devise_for :users, module: :users

  resources :users, only: [] do
    collection do
      get 'profile(/:user_id)', to: 'users#profile', as: :profile
    end
  end
  resources :categories
  resources :posts do
    member do
      patch 'mark_as_accepted_comment/:comment_id', to: "posts#mark_as_accepted_comment", as: :mark_as_accepted
    end
    resources :comments
    resources :votes, only: [] do
      collection do
        patch 'toggle_upvote'
        patch 'toggle_downvote'
      end
    end
  end

  resources :comments, only: [] do
    resources :votes, only: [] do
      collection do
        patch 'toggle_upvote'
        patch 'toggle_downvote'
      end
    end
  end

  resources :notifications, only: %i[index destroy] do
    member do
      get 'mark_as_read'
    end
  end

  resources :supports

  post '/', to: 'pages#home'

  get 'user_policies', to: 'pages#user_policies', as: :user_policies
  get 'faq', to: 'pages#faq', as: :faq
  get 'support_page', to: 'pages#support_page', as: :support_page
end
