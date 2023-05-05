Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "restaurants#index"

  resources :restaurants do
    resources :reservations, except: [:show, :index]
  end
end
