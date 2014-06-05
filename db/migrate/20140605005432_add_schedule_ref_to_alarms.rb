class AddScheduleRefToAlarms < ActiveRecord::Migration
  def change
    add_reference :alarms, :schedule, index: true
  end
end
