Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :superpowers, only: %w[index new create]
  resources :bookings, only: %w[new create]

  get '/my_superpowers', to: 'superpowers#my_superpowers'
end
