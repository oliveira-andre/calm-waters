json.extract! food, :id, :food_type_id, :name, :composition, :observation, :created_at, :updated_at
json.url food_url(food, format: :json)
