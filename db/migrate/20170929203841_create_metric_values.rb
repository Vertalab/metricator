class CreateMetricValues < ActiveRecord::Migration[5.1]
  def change
    create_table :metric_values do |t|
      t.integer :metric_id
      t.datetime :measured_at
      t.integer :value
      t.integer :delta
      t.decimal :delta_percent

      t.timestamps
    end
  end
end
