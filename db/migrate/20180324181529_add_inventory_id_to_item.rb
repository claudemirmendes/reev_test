class AddInventoryIdToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :inventory_id, :integer
  end
end
