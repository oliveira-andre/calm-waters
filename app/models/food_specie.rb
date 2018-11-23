class FoodSpecie < ApplicationRecord
  belongs_to :food

  def to_s
    food.name
  end
end
