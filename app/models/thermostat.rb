class Thermostat < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
	has_many :history_thermostats
end
