class CreateAssetIdentities < ActiveRecord::Migration[8.0]
  def change
    create_table :asset_identities do |t|
      t.uuid :uuid
      t.string :make
      t.string :model
      t.integer :year
      t.string :serial_number
      t.string :vin
      t.string :chassis_id
      t.string :unit_number
      t.bigint :created_by_user_id

      t.timestamps
    end
    add_index :asset_identities, :uuid
    add_index :asset_identities, :created_by_user_id
  end
end
