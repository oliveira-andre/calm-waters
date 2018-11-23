class Specie < ApplicationRecord
  belongs_to :food_specie
  belongs_to :ambiental_condition

  include RemoveSpecialCharacters

  def to_s
    specie_name
  end

end
