class AddDefaultTemperatureToThermostat < ActiveRecord::Migration
  def change
    add_column :thermostats, :default_temperature, :integer
  end
end
