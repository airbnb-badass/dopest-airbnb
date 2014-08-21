Rails.application.routes.draw do

  root 'home#index'

  devise_for :users

  resources :apartments do
    resources :pictures
    resources :bookings
  end

  resources :bookings, only: [] do
    patch :validate, on: :member
    patch :cancel, on: :member
  end


  get '/profile', :to => "profile#show"

  get '/bookings', :to => "profile#bookings"
end
