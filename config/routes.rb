Rails.application.routes.draw do
  devise_for :users, controllers: {
      registations: 'users/registations', # This controller handles actions related to user sign-up and account management.
      session: 'users/sessions', # This controller handles actions related to user sign-in and sign-out.
      omniauth_callbacks: 'users/omniauth_callbacks' # This controller manages the authentication flow when users sign in using external providers like Google, Facebook, etc.
    }

  root 'users#index'
  resources :users, only: [:new, :create, :index, :destroy]
  resources :profiles, only: [:show, :edit, :update] do
    post 'create_chat', on: :member
    resources :private_chats, only: [:index, :show] do
      resources :messages, only: [:create]
    end
  end
  
  resources :profiles, only: [:show, :edit, :update]
  resources :posts do
    resources :likes
    resources :comments
  end
  
  post 'profile/:id/follow', to: 'profiles#follow', as: "follow"
  post 'profile/:id/unfollow', to: 'profiles#unfollow', as: "unfollow"
  post 'profile/:id/accept', to: 'profiles#accept', as: "accept"
  post 'profile/:id/decline', to: 'profiles#decline', as: "decline"
  post 'profile/:id/cancel', to: 'profiles#cancel', as: "cancel"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
