class AmbientalCondition < ApplicationRecord
  validates :ideal_acidity, presence: true
  validates :ideal_temperature, presence: true
  validates :ideal_oxigen, presence: true
  validates :ideal_ammonia, presence: true
  validates :ideal_ph, presence: true

  belongs_to :specie


  def to_s
    "temp: #{ideal_temperature} - O²: #{ideal_oxigen} - amonia: #{ideal_ammonia} - acidez: #{ideal_acidity}"
  end
end
