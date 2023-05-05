Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "restaurants#index"

  get '/api/health', to: "api#health"
  get '/api/restaurants', to: "api#restaurants"
  post '/api/restaurants/', to: "api#create_restaurant"
  get '/api/restaurants/:id/', to: "api#restaurant"
  get '/api/restaurants/:id/reservations/', to: "api#reservations"
  post '/api/restaurants/:id/reservations/', to: "api#create_reservation"

  resources :restaurants do
    get :health, on: :member
    resources :reservations, except: [:show, :index]
  end
end
