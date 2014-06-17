class RemoveMaxFromAlarm < ActiveRecord::Migration
  def change
    remove_column :alarms, :max, :string
  end
end
