json.array!(@history_thermostats) do |history_thermostat|
  json.extract! history_thermostat, :id, :temperature, :humidity, :energy, :thermostat_id
  json.url history_thermostat_url(history_thermostat, format: :json)
end
