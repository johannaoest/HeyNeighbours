Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations/registrations"}

  get 'users/:id', to: "users#show", as: "users_show"
  root to: 'pages#home'

  resources :jobs do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, except: %i[new create] do
    resources :reviews, only: %i[new create]
  end
end
