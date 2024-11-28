class CreateCaseTotals < ActiveRecord::Migration[8.0]
  def change
    create_table :case_totals do |t|
      t.uuid :uuid
      t.bigint :case_id
      t.decimal :total_price, precision: 19, scale: 4
      t.decimal :tax_total, precision: 19, scale: 4
      t.decimal :labor_total, precision: 19, scale: 4
      t.decimal :materials_total, precision: 19, scale: 4
      t.json :metadata
      t.bigint :created_by_user_id
      t.bigint :updated_by_user_id
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :case_totals, :uuid
    add_index :case_totals, :case_id
    add_index :case_totals, :created_by_user_id
    add_index :case_totals, :updated_by_user_id
  end
end
