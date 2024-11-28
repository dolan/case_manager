class CreateSecurityPermissions < ActiveRecord::Migration[8.0]
  def change
    create_table :security_permissions do |t|
      t.uuid :uuid
      t.string :name
      t.bigint :created_by_user_id

      t.timestamps
    end
    add_index :security_permissions, :uuid
    add_index :security_permissions, :name
    add_index :security_permissions, :created_by_user_id
  end
end
