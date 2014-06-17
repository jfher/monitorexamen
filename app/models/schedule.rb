class Schedule < ActiveRecord::Base #modelo de la configuracion de temperaturas
  belongs_to :thermostat
  has_one :alarms
end
