class FoodType < ApplicationRecord
  validates :description, presence: true

  def to_s
    description
  end
end
