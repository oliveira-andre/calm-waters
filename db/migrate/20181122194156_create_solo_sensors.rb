class CreateSoloSensors < ActiveRecord::Migration[5.2]
  def change
    create_table :solo_sensors do |t|
      t.references :tank, foreign_key: true
      t.string :calcium
      t.string :ph
      t.string :phosphoror
      t.string :carbon

      t.timestamps
    end
  end
end
