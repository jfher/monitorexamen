class AddAddressToThermostat < ActiveRecord::Migration
  def change
    add_column :thermostats, :address, :string
  end
end
