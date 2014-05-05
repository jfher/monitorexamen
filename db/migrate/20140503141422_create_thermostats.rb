class CreateThermostats < ActiveRecord::Migration
  def change
    create_table :thermostats do |t|
      t.string :serial
      t.integer :temperature
      t.integer :humidity

      t.timestamps
    end
  end
end
