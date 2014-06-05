class RemoveMaxAndMinFromSchedule < ActiveRecord::Migration
  def change
    remove_column :schedules, :max, :integer
    remove_column :schedules, :min, :integer
  end
end
