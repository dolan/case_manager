class CreateUserRoleAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :user_role_assignments do |t|
      t.uuid :uuid
      t.bigint :user_id
      t.bigint :security_role_id
      t.bigint :created_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :user_role_assignments, :uuid
    add_index :user_role_assignments, :user_id
    add_index :user_role_assignments, :security_role_id
    add_index :user_role_assignments, :created_by_user_id
  end
end
