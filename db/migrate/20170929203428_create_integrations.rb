class CreateIntegrations < ActiveRecord::Migration[5.1]
  def change
    create_table :integrations do |t|
      t.string :provider
      t.string :token
      t.datetime :token_expires
      t.string :avatar
      t.string :email
      t.string :name
      t.string :uid
      t.jsonb :data
      t.integer :user_id

      t.timestamps
    end
  end
end
