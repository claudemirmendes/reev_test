class CreateInformInfecteds < ActiveRecord::Migration[5.1]
  def change
    create_table :inform_infecteds do |t|
      t.integer :survivor_send_id
      t.integer :survivor_infected_id

      t.timestamps
    end
  end
end
