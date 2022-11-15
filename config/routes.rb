Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :superpowers, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
  end

  get '/my_superpowers', to: 'superpowers#my_superpowers'
  # resources :bookings, only: %w[index show]
  # resources :bookings, only: %i[index show]
end
