json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :day_week, :max, :min, :day_time, :thermostat_id
  json.url schedule_url(schedule, format: :json)
end
