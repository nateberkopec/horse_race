Rails.application.routes.draw do
  resources :horses

  resources :races

  root 'horses#new'
end
