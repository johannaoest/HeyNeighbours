Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'

  resources :jobs do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, except: %i[new create]
end
