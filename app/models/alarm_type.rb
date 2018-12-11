class AlarmType < ApplicationRecord
  has_many :alarms

  def to_s
    description
  end
end