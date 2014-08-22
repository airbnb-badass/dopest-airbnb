Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'


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
