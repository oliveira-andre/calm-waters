class CreateMonitoringHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :monitoring_histories do |t|
      t.references :tank, foreign_key: true
      t.integer :monitoring_date
      t.string :ph
      t.string :oxigen
      t.integer :liming
      t.integer :quantity_fetilizing
      t.integer :quantitiy_food_daily
      t.string :disease
      t.string :procedimentos

      t.timestamps
    end
  end
end
