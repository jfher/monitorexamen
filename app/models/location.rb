class Location < ActiveRecord::Base #modelo locacion
 belongs_to :User
 has_many :thermostats
 geocoded_by :address
	after_validation :geocode
	after_validation :geocode, :if => :address_changed?
end
