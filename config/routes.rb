Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations/registrations"}

  get 'users/:id', to: "users#show", as: "users_show"
  get 'applyments/:job_id', to: "bookings#applyments", as: "applyments_index"
  get 'confirmation/:id', to: "bookings#confirmation", as: "booking_confirmation"
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
