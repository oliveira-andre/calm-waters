class CreateAmbientalConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :ambiental_conditions do |t|
      t.integer :ideal_temperature
      t.integer :ideal_oxigen
      t.integer :ideal_ph
      t.integer :ideal_ammonia
      t.integer :ideal_acidity

      t.timestamps
    end
  end
end
