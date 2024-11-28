class CreateCases < ActiveRecord::Migration[8.0]
  def change
    create_table :cases do |t|
      t.uuid :uuid
      t.string :reference_number
      t.string :complaint
      t.bigint :asset_id
      t.bigint :service_provider_business_location_id
      t.bigint :ship_to_customer_id
      t.bigint :bill_to_customer_id
      t.bigint :assigned_to_user_id
      t.string :source
      t.bigint :created_by_user_id
      t.bigint :updated_by_user_id
      t.datetime :estimated_complete_at
      t.datetime :actual_completed_at
      t.datetime :next_follow_up_at
      t.datetime :checked_in_at
      t.datetime :discarded_at
      t.json :metadata

      t.timestamps
    end
    add_index :cases, :uuid
    add_index :cases, :reference_number
    add_index :cases, :asset_id
    add_index :cases, :service_provider_business_location_id
    add_index :cases, :ship_to_customer_id
    add_index :cases, :bill_to_customer_id
    add_index :cases, :assigned_to_user_id
    add_index :cases, :source
    add_index :cases, :created_by_user_id
    add_index :cases, :updated_by_user_id
    add_index :cases, :next_follow_up_at
  end
end
