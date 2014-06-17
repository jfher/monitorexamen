class TermostatoModelo < ActiveRecord::Migration
  def change
  	add_reference :modelos, :thermostat, index: true
  end
end
