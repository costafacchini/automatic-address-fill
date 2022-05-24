Rails.application.routes.draw do
  root 'people#index'

  resources :people
  resources :cities, only: [:index]
  resources :streets, only: [:index]
  resources :street_numbers, only: [:index]
end
