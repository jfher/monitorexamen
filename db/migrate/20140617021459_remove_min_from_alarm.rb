class RemoveMinFromAlarm < ActiveRecord::Migration
  def change
    remove_column :alarms, :min, :string
  end
end
