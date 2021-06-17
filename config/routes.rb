Rails.application.routes.draw do
  get 'users/:id', to: "users#show", as: "users_show"
  devise_for :users
  root to: 'pages#home'

  resources :jobs do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, except: %i[new create] do
    resources :reviews, only: %i[new create]
  end
end
