class Tank < ApplicationRecord
  belongs_to :user
  belongs_to :specie

  include RemoveSpecialCharacters

  validates :population_date, presence: true
  validates :initial_quantity, presence: true
end
