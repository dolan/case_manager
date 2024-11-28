class CreateBuisnesses < ActiveRecord::Migration[8.0]
  def change
    create_table :buisnesses do |t|
      t.uuid :uuid
      t.string :category
      t.string :name
      t.string :description
      t.bigint :primary_location_id
      t.string :brand_identifier
      t.json :metadata
      t.bigint :created_by_user_id
      t.bigint :updated_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :buisnesses, :uuid
    add_index :buisnesses, :category
    add_index :buisnesses, :name
    add_index :buisnesses, :created_by_user_id
    add_index :buisnesses, :updated_by_user_id
  end
end
