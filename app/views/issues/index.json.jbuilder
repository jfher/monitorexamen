json.array!(@issues) do |issue|
  json.extract! issue, :id, :description, :status, :resolution, :thermostat_id
  json.url issue_url(issue, format: :json)
end
