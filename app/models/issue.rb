class Issue < ActiveRecord::Base #modelo de lod problemas del termostato
  belongs_to :thermostat
  has_many :reviews
end
