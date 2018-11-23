class AmbientalCondition < ApplicationRecord
  def to_s
    "temp: #{ideal_temperature} - O²: #{ideal_oxigen} - amonia: #{ideal_ammonia} - acidez: #{ideal_acidity}"
  end
end
