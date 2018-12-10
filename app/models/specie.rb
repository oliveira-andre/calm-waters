class Specie < ApplicationRecord
  belongs_to :food_specie
  has_one :ambiental_condition

  include RemoveSpecialCharacters

  validates :specie_name, presence: true
  validates :price, presence: true
  validates :weight, presence: true

  validate :no_price

  def to_s
    specie_name
  end

  def no_price
    errors.add(:price, "Valor R$0,00 não pode ser adicionado") if price == "000"
  end

end
