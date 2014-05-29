class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.integer :max
      t.integer :min
      t.integer :time

      t.timestamps
    end
  end
end
