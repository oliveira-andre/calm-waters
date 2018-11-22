class CreateMonitoringHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :monitoring_histories do |t|
      t.references :tank, foreign_key: true
      t.int :monitoring_date
      t.string :ph
      t.string :oxigen
      t.int :liming
      t.int :quantity_fetilizing
      t.int :quantitiy_food_daily
      t.string :disease
      t.string :procedimentos

      t.timestamps
    end
  end
end
