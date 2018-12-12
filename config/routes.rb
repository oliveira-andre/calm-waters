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
  resources :dashboards, only: :index
  scope :admin do
    get "/", to: "admin#index", as: "alarms"
    get "/new", to: "admin#new", as: "new_alarm"
    get "/:id", to: "admin#edit", as: "edit_alarm"
    post "/", to: "admin#create"
    patch ".:id", to: "admin#update"
  end
  get "/users/new", to: "users#new"
  get "/users", to: "users#index"
  get "/species", to: "species#index", as: "species"
  get "/species/new", to: "species#new", as: "new_specie"
  get "/species/edit/:id", to: "species#edit", as: "edit_species"
  post "/species", to: "species#create"
  patch "/species.:id", to: "species#update"
  delete "/species.:id", to: "species#destroy"
  post "/tanks/find_date", to: "tanks#find_date"
  post "/ambiental_conditions/calc", to: "ambiental_conditions#calculate"
  post "/notifications/update_view/:id", to: "notifications#update_view"
  post "/dashboards/ambiental_condition_values", to: "dashboards#get_ambiental_condition_values"
  post "/dashboards/tank_values", to: "dashboards#get_tank_values"
  post "/dashboards/ambiental_and_tank_values", to: "dashboards#get_difference_between_ambiental_condition_and_tank_values"
  post "/feed/:id", to: "tanks#feed"
  post "/check_alarms", to: "admin#catch_alarm"
  post "/dados_diarios", to: "tanks#insert_diary_data"
  post "/users/create", to: "users#create"
  redirect("/users/sign_in")

  authenticate :user do
    root to: "dashboards#index"
  end
end
