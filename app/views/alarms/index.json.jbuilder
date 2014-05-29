json.array!(@alarms) do |alarm|
  json.extract! alarm, :id, :max, :min, :time
  json.url alarm_url(alarm, format: :json)
end
