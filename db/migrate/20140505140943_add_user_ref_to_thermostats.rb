class AddUserRefToThermostats < ActiveRecord::Migration
  def change
    add_reference :thermostats, :user, index: true
  end
end
