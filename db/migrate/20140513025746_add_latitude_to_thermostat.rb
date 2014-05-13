class AddLatitudeToThermostat < ActiveRecord::Migration
  def change
    add_column :thermostats, :latitude, :float
  end
end
