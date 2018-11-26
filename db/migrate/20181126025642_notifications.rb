class Notifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :message
      t.string :type_message
      t.references :tank, foreign_key: true
      t.boolean :viewed, default: false

      t.timestamps
    end
  end
end
