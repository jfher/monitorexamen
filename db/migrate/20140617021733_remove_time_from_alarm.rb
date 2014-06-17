class RemoveTimeFromAlarm < ActiveRecord::Migration
  def change
    remove_column :alarms, :time, :string
  end
end
