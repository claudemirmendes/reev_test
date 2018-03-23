class AddSurvivorIdToItem < ActiveRecord::Migration[5.1]
  def change
  	add_column :items, :survivor_id, :integer 
  end
end
