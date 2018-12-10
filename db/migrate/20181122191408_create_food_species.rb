class CreateFoodSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :food_species do |t|
      t.integer :food_quantity
      t.references :food_type, foreign_key: true
      t.string :name
      t.string :composition
      t.string :observation
      t.string :price

      t.timestamps
    end
  end
end
