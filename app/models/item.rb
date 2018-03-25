class Item < ApplicationRecord
  enum type: [ :agua, :alimento, :medicacao, :municao ]

  def self.create_item(item,inventory_id)
  	@item = Item.create(name: item["item"],
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
end
