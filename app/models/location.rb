class Location < ActiveRecord::Base
  belongs_to :Thermostat
  geocoded_by :address
	after_validation :geocode
	after_validation :geocode, :if => :address_changed?
end
