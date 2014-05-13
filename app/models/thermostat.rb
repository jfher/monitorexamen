class Thermostat < ActiveRecord::Base
	belongs_to :user
	has_many :history_thermostats
	geocoded_by :address
	after_validation :geocode
	after_validation :geocode, :if => :address_changed?
end
