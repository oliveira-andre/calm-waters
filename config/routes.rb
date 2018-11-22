Rails.application.routes.draw do
  devise_for :users
  resources :water_sensors
  resources :solo_sensors
  resources :monitoring_histories
  resources :tanks
  resources :species
  resources :food_species
  resources :foods
  resources :food_types
  resources :ambiental_conditions

    redirect("/users/sign_in")
  authenticate :user do
    root to: "tanks#index"
  end
end
