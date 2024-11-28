class CreateGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :groups do |t|
      t.uuid :uuid
      t.string :name
      t.string :category
      t.bigint :created_by_user_id
      t.bigint :updated_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :groups, :uuid
    add_index :groups, :name
    add_index :groups, :category
    add_index :groups, :created_by_user_id
    add_index :groups, :updated_by_user_id
  end
end
