Rails.application.routes.draw do

  root 'home#index'

  devise_for :users

  resources :apartments

  get '/profile', :to => "profile#show"

end
