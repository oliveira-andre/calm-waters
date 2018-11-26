class MonitoringHistory < ApplicationRecord
  belongs_to :tank

  validates :liming, presence: true
  validates :oxigen, presence: true
  validates :ph, presence: true
  validates :quantitiy_food_daily, presence: true
  validates :quantity_fetilizing, presence: true
  validates :monitoring_date, presence: true

end
