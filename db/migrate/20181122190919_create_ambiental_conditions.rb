class CreateAmbientalConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :ambiental_conditions do |t|
      t.int :ideal_temperature
      t.int :ideal_oxigen
      t.int :ideal_ph
      t.int :ideal_ammonia
      t.int :ideal_acidity

      t.timestamps
    end
  end
end
