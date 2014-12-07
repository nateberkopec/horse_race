Rails.application.routes.draw do
  resources :horses, only: [:new, :create, :update]

  resources :races, only: [:show]

  root 'horses#new'
end
