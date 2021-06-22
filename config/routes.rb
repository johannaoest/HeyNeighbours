Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations/registrations"}

  patch 'confirm/:id/:booking_id', to: "jobs#confirm", as: "confirm_job"
  get 'users/:id', to: "users#show", as: "users_show"
  get 'applyments/:job_id', to: "bookings#applyments", as: "applyments_index"
  get 'confirmation/:id', to: "bookings#create_confirmation", as: "booking_confirmation"
  get 'check_confirmation/:id', to: "bookings#check_confirmation", as: "check_confirmation"
  

  root to: 'pages#home'

  resources :jobs do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, except: %i[new create] do
    resources :reviews, only: %i[new create]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

end
