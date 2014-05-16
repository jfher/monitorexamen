json.array!(@locations) do |location|
  json.extract! location, :id, :name, :address, :latitude, :longitude, :Thermostat_id
  json.url location_url(location, format: :json)
end
