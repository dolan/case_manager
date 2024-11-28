class CreateAssets < ActiveRecord::Migration[8.0]
  def change
    create_table :assets do |t|
      t.uuid :uuid
      t.bigint :asset_identity_id
      t.bigint :business_location_id
      t.bigint :created_by_user_id
      t.bigint :updated_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :assets, :uuid
    add_index :assets, :asset_identity_id
    add_index :assets, :business_location_id
    add_index :assets, :created_by_user_id
    add_index :assets, :updated_by_user_id
  end
end
