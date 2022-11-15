Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :superpowers, only: %w[index new create edit update]

  get '/my_superpowers', to: 'superpowers#my_superpowers'

  resources :bookings, only: %w[index show]
end
