class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :day_week
      t.integer :max
      t.integer :min
      t.string :day_time
      t.references :thermostat, index: true

      t.timestamps
    end
  end
end
