class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.integer :survivor_id

      t.timestamps
    end
  end
end
