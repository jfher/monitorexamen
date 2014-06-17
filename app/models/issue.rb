class Issue < ActiveRecord::Base #modelo de lod problemas del termostato
  belongs_to :thermostat
end
