class Thermostat < ActiveRecord::Base
	belongs_to :user
	has_many :history_thermostats
	has_many :locations
	geocoded_by :address
	after_validation :geocode
	after_validation :geocode, :if => :address_changed?
end
