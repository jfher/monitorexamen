class CreateHistoryThermostats < ActiveRecord::Migration
  def change
    create_table :history_thermostats do |t|
      t.integer :temperature
      t.integer :humidity
      t.integer :energy
      t.references :thermostat, index: true

      t.timestamps
    end
  end
end
