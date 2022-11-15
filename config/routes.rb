Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :superpowers, only: %i[index show new create destroy] do
    resources :bookings, only: %i[new create]
  end

  get '/my_superpowers', to: 'superpowers#my_superpowers'
  get '/my_superpowers/:id/edit', to: 'superpowers#edit', as: :edit_superpower
  patch '/my_superpowers/:id', to: 'superpowers#update', as: :update_superpower
  get '/my_superpowers/:id/toggle_availability', to: 'superpowers#toggle_availability', as: :toggle_availability

  resources :bookings, only: %i[index]
  get '/my_bookings', to: 'bookings#my_bookings'
  get '/my_bookings/:id', to: 'bookings#show', as: :my_booking_details
end
