class Item < ApplicationRecord
  enum tipo: [ :agua, :alimento, :medicacao, :municao ]

  def self.create_item(item,inventory_id)
  	@item = Item.create(name: item["name"],
                        inventory_id: inventory_id,
                        tipo: item["tipo"]
  		                )
  	value = @item.return_value(item["tipo"])
    @item.update(value: value)
  end

  def return_value(tipo)
  	return 4 if tipo == 0
  	return 3 if tipo == 1  
  	return 2 if tipo == 2
  	return 1 if tipo == 3
  end



  def self.exchanged(items_send,items_received)

    @items_send = []
    @items_received = []

    items_send.each do |item|
      @items_send << Item.where(id: item["id"]).last
    end
    items_received.each do |item|
      @items_received << Item.where(id: item["id"]).last
    end
    
    verificate = self.verificates(@items_send,@items_received)
    self.update_inventory_id(@items_send[0].id,@items_received[0].id,@items_send,@items_received)

  end

  def self.verificates(items_send,items_received)
    @value_send_items = 0
    @value_received_items = 0

    items_send.each do |item|
      @value_send_items += item.value
    end

    items_received.each do |item|
      @value_received_items += item.value
    end

    inventory_send = Inventory.where(id:items_send[0].inventory_id).last
    inventory_received = Inventory.where(id: items_received[0].inventory_id).last

    survivor_send = Survivor.where(id: inventory_send.survivor_id)
    survivor_received = Survivor.where(id: inventory_send.survivor_id)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    return true if @value_send_items == @value_received_items
    return true if survivor_send == 0 || survivor_received == 0
  end

  def self.update_inventory_id(inventory_send_id,inventory_received_id,items_send,items_received)
    items_send.each do |item|
      item.update(inventory_id:inventory_received_id)
    end
    items_received.each do |item|
      item.update(inventory_id:inventory_send_id)
    end
  end
end
