class FoodSpecie < ApplicationRecord
  belongs_to :food

  validates :food_quantity, presence: true

  def to_s
    food.name
  end
end
