class RemoveAddressAndLatitudeAndLongitudeFromThermostat < ActiveRecord::Migration
  def change
    remove_column :thermostats, :address, :string
    remove_column :thermostats, :latitude, :float
    remove_column :thermostats, :longitude, :float
  end
end
