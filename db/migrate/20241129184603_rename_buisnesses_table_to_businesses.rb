class RenameBuisnessesTableToBusinesses < ActiveRecord::Migration[8.0]
  def change
    rename_table :buisnesses, :businesses
  end
end
