class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.uuid :uuid
      t.bigint :business_location_id
      t.string :display_name
      t.string :description
      t.json :metadata
      t.bigint :created_by_user_id
      t.bigint :updated_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :customers, :uuid
    add_index :customers, :business_location_id
    add_index :customers, :display_name
    add_index :customers, :created_by_user_id
    add_index :customers, :updated_by_user_id
  end
end
