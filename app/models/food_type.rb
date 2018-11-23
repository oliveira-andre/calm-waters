class FoodType < ApplicationRecord
  def to_s
    description
  end
end
