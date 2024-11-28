class CreateSecurityRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :security_roles do |t|
      t.uuid :uuid
      t.string :name
      t.string :category
      t.bigint :created_by_user_id
      t.bigint :updated_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :security_roles, :uuid
    add_index :security_roles, :name
    add_index :security_roles, :category
    add_index :security_roles, :created_by_user_id
    add_index :security_roles, :updated_by_user_id
  end
end
