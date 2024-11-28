class CreateSecurityRolePermissions < ActiveRecord::Migration[8.0]
  def change
    create_table :security_role_permissions do |t|
      t.uuid :uuid
      t.bigint :security_role_id
      t.bigint :security_permission_id
      t.bigint :created_by_user_id

      t.timestamps
    end
    add_index :security_role_permissions, :uuid
    add_index :security_role_permissions, :security_role_id
    add_index :security_role_permissions, :security_permission_id
    add_index :security_role_permissions, :created_by_user_id
  end
end
