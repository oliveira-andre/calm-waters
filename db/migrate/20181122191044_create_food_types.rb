class CreateFoodTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :food_types do |t|
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
