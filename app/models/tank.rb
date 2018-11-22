class Tank < ApplicationRecord
  belongs_to :user
  belongs_to :specie
end
