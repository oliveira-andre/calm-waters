class CreateSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :species do |t|
      t.string :price
      t.decimal :weight
      t.references :food_specie, foreign_key: true
      t.references :ambiental_condition, foreign_key: true
      t.string :specie_name
      t.string :observation

      t.timestamps
    end
  end
end
