class HistoryThermostat < ActiveRecord::Base #modelo historial de temperaturas de termostatos 
  belongs_to :thermostat
end
