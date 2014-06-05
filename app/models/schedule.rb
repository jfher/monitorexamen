class Schedule < ActiveRecord::Base
  belongs_to :thermostat
  has_one :alarms
end
