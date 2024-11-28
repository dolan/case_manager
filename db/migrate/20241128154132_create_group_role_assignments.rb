class CreateGroupRoleAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :group_role_assignments do |t|
      t.uuid :uuid
      t.bigint :group_id
      t.bigint :security_role_id
      t.bigint :created_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :group_role_assignments, :uuid
    add_index :group_role_assignments, :group_id
    add_index :group_role_assignments, :security_role_id
    add_index :group_role_assignments, :created_by_user_id
  end
end
