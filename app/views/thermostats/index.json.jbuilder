json.array!(@thermostats) do |thermostat|
  json.extract! thermostat, :id, :serial, :temperature, :humidity
  json.url thermostat_url(thermostat, format: :json)
end
