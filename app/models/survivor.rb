class Survivor < ApplicationRecord

  def self.infected(survivor)
    survivor.update(infected: true)
  end

  def create_inventory(survivor_id,items)
  	@inventory = Inventory.create(survivor_id: survivor_id)
  	create_item(items,@inventory.id)
  end
   
   def create_item(items,inventory_id)
     items.each do |item|
     	@item = Item.create_item(item,inventory_id)
     end
   end

end
