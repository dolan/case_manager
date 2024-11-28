class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.uuid :uuid
      t.string :name
      t.string :description
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :city
      t.string :geographical_region
      t.string :country_iso_code
      t.string :timezone
      t.string :culture
      t.json :metadata
      t.bigint :created_by_user_id
      t.string :updated_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :locations, :uuid
    add_index :locations, :name
    add_index :locations, :created_by_user_id
    add_index :locations, :updated_by_user_id
  end
end
