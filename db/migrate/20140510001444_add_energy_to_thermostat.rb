class AddEnergyToThermostat < ActiveRecord::Migration
  def change
  	add_column :thermostats, :energy, :int
  end
end
