class Alarms < ActiveRecord::Migration[5.2]
  def change
    create_table :alarms do |t|
      t.references :alarm_type, foreign_key: true
      t.boolean :active, default: false
      t.boolean :sound_effect, default: false
      t.string :message

      t.timestamps
    end
  end
end
