class ChangeTypeToInteger < ActiveRecord::Migration[5.1]
  def change
  	change_column :items, :tipo, 'integer USING CAST(tipo AS integer)'
  end
end
