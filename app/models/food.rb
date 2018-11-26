class Food < ApplicationRecord
  belongs_to :food_type

  validates :name, presence: true
  validates :composition, presence: true
end
