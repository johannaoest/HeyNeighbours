Rails.application.routes.draw do
  devise_for :users
  get 'users/:id', to: "users#show", as: "users_show"
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
