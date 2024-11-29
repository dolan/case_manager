class AddBusinessIdToGroupRoleAssignments < ActiveRecord::Migration[8.0]
  def change
    add_column :group_role_assignments, :business_id, :bigint
    add_index :group_role_assignments, :business_id
  end
end
