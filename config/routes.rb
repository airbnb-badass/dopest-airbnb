Rails.application.routes.draw do

  root 'home#index'

  devise_for :users

  resources :apartments do
    resources :pictures
  end



  get '/profile', :to => "profile#show"

end
