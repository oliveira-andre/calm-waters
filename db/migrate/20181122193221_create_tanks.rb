class CreateTanks < ActiveRecord::Migration[5.2]
  def change
    create_table :tanks do |t|
      t.references :user, foreign_key: true
      t.references :specie, foreign_key: true
      t.integer :population_date
      t.integer :initial_quantity
      t.integer :depopulation_date
      t.integer :final_quantity

      t.timestamps
    end
  end
end
