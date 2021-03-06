class Thermostat < ActiveRecord::Base #modelo del termostato
	belongs_to :user
	belongs_to :location
	has_many :history_thermostats
	has_one :alarms
	has_one :modelos
	scope :search, lambda { |search_word| where('thermostats.model_id LIKE ?', "%#{search_word}%") }
end
