class Cambiar2 < ActiveRecord::Migration
  def change
  	change_column :users, :state, :boolean
  end
end
