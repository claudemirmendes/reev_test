class Item < ApplicationRecord
  enum type: [ :agua, :alimento, :medicacao, :municao ]

  def self.create_item(item,inventory_id)
  	byebug
  	@item = Item.create(name: item["item"],
                        inventory_id: inventory_id,
                        tipo: item["tipo"]
  		                )
  end
end
