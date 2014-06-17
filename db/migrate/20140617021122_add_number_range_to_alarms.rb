class AddNumberRangeToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :number_range, :integer
  end
end
