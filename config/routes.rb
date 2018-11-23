Rails.application.routes.draw do
  devise_for :users
  resources :water_sensors
  resources :solo_sensors
  resources :monitoring_histories
  resources :tanks
  resources :food_species
  resources :foods
  resources :food_types
  resources :ambiental_conditions
  resource :dashboards, only: :index
  get "/species", to: "species#index"
  get "/species/new", to: "species#new"
  get "/species/edit/:id", to: "species#edit"
  post "/species", to: "species#create", as: "edit_species"
  redirect("/users/sign_in")

  authenticate :user do
    root to: "dashboards#index"
  end
end
