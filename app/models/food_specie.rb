class FoodSpecie < ApplicationRecord
  belongs_to :food_type

  validates :name, presence: true
  validates :composition, presence: true
  validates :food_quantity, presence: true

  def to_s
    food.name
  end
end
