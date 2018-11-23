class Specie < ApplicationRecord
  belongs_to :food_specie
  belongs_to :ambiental_condition

end
