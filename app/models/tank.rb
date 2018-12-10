class Tank < ApplicationRecord
  belongs_to :user
  belongs_to :specie

  has_many :notifications

  include RemoveSpecialCharacters

  validates :population_date, presence: true
  validates :initial_quantity, presence: true
  validates :acidity, presence: true

  def to_s
    tank_type
  end
end
