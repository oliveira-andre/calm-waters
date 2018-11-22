Rails.application.routes.draw do
  resources :water_sensors
  resources :solo_sensors
  resources :monitoring_histories
  resources :tanks
  resources :species
  resources :food_species
  resources :foods
  resources :food_types
  resources :ambiental_conditions
  devise_for :users
  
end
