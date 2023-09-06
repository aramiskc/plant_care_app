Rails.application.routes.draw do
  resources :users do
    resources :schedules
    resources :plants
    resources :sessions, only: [:new, :create, :destroy]
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
  end
end
