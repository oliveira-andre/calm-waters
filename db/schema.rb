# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_26_025644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alarm_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alarms", force: :cascade do |t|
    t.bigint "alarm_type_id"
    t.boolean "active", default: false
    t.boolean "sound_effect", default: false
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alarm_type_id"], name: "index_alarms_on_alarm_type_id"
  end

  create_table "ambiental_conditions", force: :cascade do |t|
    t.integer "ideal_temperature"
    t.integer "ideal_oxigen"
    t.integer "ideal_ph"
    t.integer "ideal_ammonia"
    t.integer "ideal_acidity"
    t.bigint "specie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specie_id"], name: "index_ambiental_conditions_on_specie_id"
  end

  create_table "food_species", force: :cascade do |t|
    t.integer "food_quantity"
    t.bigint "food_type_id"
    t.string "name"
    t.string "composition"
    t.string "observation"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_type_id"], name: "index_food_species_on_food_type_id"
  end

  create_table "food_types", force: :cascade do |t|
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monitoring_histories", force: :cascade do |t|
    t.bigint "tank_id"
    t.integer "monitoring_date"
    t.string "ph"
    t.string "oxigen"
    t.integer "liming"
    t.integer "quantity_fetilizing"
    t.integer "quantitiy_food_daily"
    t.string "disease"
    t.string "procedimentos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tank_id"], name: "index_monitoring_histories_on_tank_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.string "type_message"
    t.bigint "tank_id"
    t.boolean "viewed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tank_id"], name: "index_notifications_on_tank_id"
  end

  create_table "perfils", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solo_sensors", force: :cascade do |t|
    t.bigint "tank_id"
    t.string "calcium"
    t.string "ph"
    t.string "phosphoror"
    t.string "carbon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tank_id"], name: "index_solo_sensors_on_tank_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "price"
    t.decimal "weight"
    t.bigint "food_specie_id"
    t.string "specie_name"
    t.string "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_specie_id"], name: "index_species_on_food_specie_id"
  end

  create_table "tanks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "specie_id"
    t.integer "population_date"
    t.integer "initial_quantity"
    t.integer "depopulation_date"
    t.integer "final_quantity"
    t.string "tank_type"
    t.integer "acidity"
    t.integer "temperature"
    t.integer "oxigen"
    t.integer "ammonia"
    t.integer "ph"
    t.integer "feeded", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specie_id"], name: "index_tanks_on_specie_id"
    t.index ["user_id"], name: "index_tanks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "example@example.com"
    t.string "name", default: "", null: false
    t.string "cpf", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "perfil_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_users_on_cpf", unique: true
    t.index ["perfil_id"], name: "index_users_on_perfil_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "water_sensors", force: :cascade do |t|
    t.bigint "tank_id"
    t.string "calcium"
    t.string "ph"
    t.string "phosphoror"
    t.string "hydrogen"
    t.string "oxigen"
    t.string "acidity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tank_id"], name: "index_water_sensors_on_tank_id"
  end

  add_foreign_key "alarms", "alarm_types"
  add_foreign_key "ambiental_conditions", "species", column: "specie_id"
  add_foreign_key "food_species", "food_types"
  add_foreign_key "monitoring_histories", "tanks"
  add_foreign_key "notifications", "tanks"
  add_foreign_key "solo_sensors", "tanks"
  add_foreign_key "species", "food_species", column: "food_specie_id"
  add_foreign_key "tanks", "species", column: "specie_id"
  add_foreign_key "tanks", "users"
  add_foreign_key "users", "perfils"
  add_foreign_key "water_sensors", "tanks"
end
