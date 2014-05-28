class Fixing < ActiveRecord::Migration
  def change
  	  remove_column :locations, :Thermostat_id
      add_reference :locations, :user, index: true
      add_reference :thermostats, :location, index: true
  end
end
