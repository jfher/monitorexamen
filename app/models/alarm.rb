class Alarm < ActiveRecord::Base #modelo de alarma
	belongs_to :schedule
end
