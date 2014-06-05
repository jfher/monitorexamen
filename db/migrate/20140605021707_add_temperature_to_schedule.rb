class AddTemperatureToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :temperature, :integer
  end
end
