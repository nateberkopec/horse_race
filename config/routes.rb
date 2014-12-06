Rails.application.routes.draw do
  resources :horses

  resources :races

  root 'home#index'


end
