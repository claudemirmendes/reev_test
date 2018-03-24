class ChangeTypeToTipo < ActiveRecord::Migration[5.1]
  def change
  	rename_column :items, :type, :tipo
  end
end
