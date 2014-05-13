class AddLongitudeToThermostat < ActiveRecord::Migration
  def change
    add_column :thermostats, :longitude, :float
  end
end
