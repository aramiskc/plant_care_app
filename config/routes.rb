Rails.application.routes.draw do
  post '/users', to: 'users#create'
  post '/sessions', to: 'sessions#create'
  resources :schedules, only: [:create, :index, :show]
  # resources :plants
  get "/plants", to: "plants#index"
end
