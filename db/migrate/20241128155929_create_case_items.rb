class CreateCaseItems < ActiveRecord::Migration[8.0]
  def change
    create_table :case_items do |t|
      t.uuid :uuid
      t.bigint :case_id
      t.integer :item_order
      t.string :title
      t.string :description
      t.json :metadata
      t.string :code
      t.string :source
      t.string :category
      t.decimal :quantity, precision: 19, scale: 4
      t.string :unit_of_measure
      t.decimal :unit_price, precision: 19, scale: 4
      t.bigint :created_by_user_id
      t.bigint :updated_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :case_items, :uuid
    add_index :case_items, :case_id
    add_index :case_items, :created_by_user_id
    add_index :case_items, :updated_by_user_id
  end
end
