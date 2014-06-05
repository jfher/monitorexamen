class AddThermostatRefToAlarms < ActiveRecord::Migration
  def change
    add_reference :alarms, :thermostat, index: true
  end
end
