class ChangeValueToInteger < ActiveRecord::Migration[5.1]
  def change
  	change_column :items, :value, 'integer USING CAST(value AS integer)'
  end
end
