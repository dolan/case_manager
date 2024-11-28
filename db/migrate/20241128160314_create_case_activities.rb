class CreateCaseActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :case_activities do |t|
      t.uuid :uuid
      t.bigint :case_id
      t.string :title
      t.string :description
      t.string :category
      t.datetime :occurred_at
      t.bigint :actor_user_id
      t.bigint :target_user_id
      t.string :audience_category
      t.json :metadata
      t.bigint :created_by_user_id
      t.bigint :updated_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :case_activities, :uuid
    add_index :case_activities, :case_id
    add_index :case_activities, :category
    add_index :case_activities, :occurred_at
    add_index :case_activities, :actor_user_id
    add_index :case_activities, :target_user_id
    add_index :case_activities, :created_by_user_id
    add_index :case_activities, :updated_by_user_id
  end
end
