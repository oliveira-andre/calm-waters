class CreateFoodSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :food_species do |t|
      t.references :food, foreign_key: true
      t.integer :food_quantity

      t.timestamps
    end
  end
end
