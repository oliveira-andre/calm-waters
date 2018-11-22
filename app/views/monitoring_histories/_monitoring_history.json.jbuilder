json.extract! monitoring_history, :id, :tank_id, :monitoring_date, :ph, :oxigen, :liming, :quantity_fetilizing, :quantitiy_food_daily, :disease, :procedimentos, :created_at, :updated_at
json.url monitoring_history_url(monitoring_history, format: :json)
