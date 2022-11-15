Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :superpowers, only: %i[index show new create]
  resources :bookings, only: %i[new create]

  get '/my_superpowers', to: 'superpowers#my_superpowers'

  resources :bookings, only: %w[index]
  get '/my_bookings', to: 'bookings#my_bookings'
  get '/my_bookings/:id', to: 'bookings#show', as: :my_booking_details
end
