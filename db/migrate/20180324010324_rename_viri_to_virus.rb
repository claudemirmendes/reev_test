class RenameViriToVirus < ActiveRecord::Migration[5.1]
  def change
  	rename_table :viri, :virus
  end
end
