class CreateTanks < ActiveRecord::Migration[5.2]
  def change
    create_table :tanks do |t|
      t.references :user, foreign_key: true
      t.references :specie, foreign_key: true
      t.int :population_date
      t.int :initial_quantity
      t.int :depopulation_date
      t.int :final_quantity

      t.timestamps
    end
  end
end
