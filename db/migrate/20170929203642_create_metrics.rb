class CreateMetrics < ActiveRecord::Migration[5.1]
  def change
    create_table :metrics do |t|
      t.string :name
      t.integer :integration_id
      t.integer :user_id
      t.string :metric_source_type, default: 'segment'
      t.string :metric_source
      t.integer :check_period_hours, default: 24
      t.boolean :active, default: false
      t.string :direction # positive or negative

      t.timestamps
    end
  end
end
