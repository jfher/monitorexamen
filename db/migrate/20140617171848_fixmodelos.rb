class Fixmodelos < ActiveRecord::Migration
  def change

  	remove_column :modelos, :thermostat_id
  	add_reference :thermostats, :modelo, index: true
  end
end
