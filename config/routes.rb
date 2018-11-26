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
  get "/species", to: "species#index", as: "species"
  get "/species/new", to: "species#new", as: "new_specie"
  get "/species/edit/:id", to: "species#edit", as: "edit_species"
  post "/species", to: "species#create"
  patch "/species.:id", to: "species#update"
  delete "/species.:id", to: "species#destroy"
  redirect("/users/sign_in")

  authenticate :user do
    root to: "dashboards#index"
  end
end
