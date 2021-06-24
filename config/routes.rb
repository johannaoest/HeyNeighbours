Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations/registrations"}

  post 'new_chat/:booking_id', to: "chatrooms#create", as: "new_chat"
  patch 'confirm/:id/:booking_id', to: "jobs#confirm", as: "confirm_job"
  get 'users/:id', to: "users#show", as: "users_show"
  get 'applyments/:job_id', to: "bookings#applyments", as: "applyments_index"
  get 'confirmation/:id', to: "bookings#create_confirmation", as: "booking_confirmation"
  get 'check_confirmation/:id', to: "bookings#check_confirmation", as: "check_confirmation"
  patch 'final_confirm/:id', to: "bookings#confirm", as: "final_confirmation"

  mount StripeEvent::Engine, at: '/stripe-webhooks'


  root to: 'pages#home'

  resources :jobs do
    resources :bookings, only: %i[new create]
      resources :orders, only: [:show, :create] do
      resources :payments, only: :new
      end
  end

  resources :bookings, except: %i[new create] do
    resources :reviews, only: %i[new create]
  end

  resources :chatrooms, only: %i[show index] do
    resources :messages, only: :create
  end





end
