class AddBusinessIdToUserRoleAssignments < ActiveRecord::Migration[8.0]
  def change
    add_column :user_role_assignments, :business_id, :bigint
    add_index :user_role_assignments, :business_id
  end
end
