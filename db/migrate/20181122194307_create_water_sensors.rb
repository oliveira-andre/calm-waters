class CreateWaterSensors < ActiveRecord::Migration[5.2]
  def change
    create_table :water_sensors do |t|
      t.references :tank, foreign_key: true
      t.string :calcium
      t.string :ph
      t.string :phosphoror
      t.string :hydrogen
      t.string :oxigen
      t.string :acidity

      t.timestamps
    end
  end
end
