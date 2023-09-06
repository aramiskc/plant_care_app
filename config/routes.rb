Rails.application.routes.draw do
  resources :users do
    resources :schedules
    resources :plants
  end

  resources :sessions, only: [:new, :create, :destroy]
end
