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

   def self.generate_reports
     reports = []
     percentage_infected = Survivor.generate_percentage_infected
     percentage_non_infected = Survivor.generate_percentage_non_infected
     points_lost = Survivor.generate_points_lost_per_survivor
     water_per_survivor = Survivor.average(0)
     food_per_survivor  = Survivor.average(1)
     medication_per_survivor = Survivor.average(2)
     ammunition_per_survivor = Survivor.average(3)
     reports << {
             :percentage_infected => percentage_infected,
             :percentage_non_infected => percentage_non_infected,
             :points_lost => points_lost,
             :water_per_survivor => water_per_survivor,
             :food_per_survivor => food_per_survivor,
             :medication_per_survivor => medication_per_survivor,
             :ammunition_per_survivor => ammunition_per_survivor
     }
     reports
   end

   def self.generate_percentage_infected
     all_survivors = Survivor.all.length
     all_survivors_infected = Survivor.where(infected: true).length

     percentage = all_survivors_infected.to_f / all_survivors.to_f * 100
   end

   def self.generate_percentage_non_infected
     all_survivors = Survivor.all.length
     all_survivors_non_infected = Survivor.where(infected: nil).length

     percentage = all_survivors_non_infected.to_f / all_survivors.to_f * 100
   end

   def self.generate_points_lost_per_survivor
     items = []
     amount = 0
     all_survivors_infected = Survivor.where(infected: true)

     all_survivors_infected.each do |survivor|
       inventory = Inventory.where(survivor_id: survivor.id).last
       items = Item.where(inventory_id: inventory.id)
     end

     items.each do |item|
       amount += item.value
     end
    amount
   end

   def self.average(tipo)
     all_survivors_non_infected = Survivor.where(infected: nil).length
     items = Item.where(tipo: tipo).length
     average = all_survivors_non_infected.to_f / items.to_f
     average
   end
end
