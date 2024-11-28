class CreateUserGroupMemberships < ActiveRecord::Migration[8.0]
  def change
    create_table :user_group_memberships do |t|
      t.uuid :uuid
      t.bigint :user_id
      t.bigint :group_id
      t.bigint :created_by_user_id
      t.bigint :updated_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :user_group_memberships, :uuid
    add_index :user_group_memberships, :user_id
    add_index :user_group_memberships, :group_id
    add_index :user_group_memberships, :created_by_user_id
  end
end
