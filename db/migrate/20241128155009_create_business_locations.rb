class CreateBusinessLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :business_locations do |t|
      t.uuid :uuid
      t.bigint :business_id
      t.bigint :location_id
      t.bigint :created_by_user_id
      t.json :metadata
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :business_locations, :uuid
    add_index :business_locations, :business_id
    add_index :business_locations, :location_id
    add_index :business_locations, :created_by_user_id
  end
end
