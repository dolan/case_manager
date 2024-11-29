class AddNameToBusinessLocations < ActiveRecord::Migration[8.0]
  def change
    add_column :business_locations, :name, :string
    add_index :business_locations, :name
  end
end
