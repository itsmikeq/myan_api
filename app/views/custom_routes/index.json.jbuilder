json.array!(@custom_routes) do |custom_route|
  json.extract! custom_route, :id, :owner_id, :name, :owner_type, :data, :version
  json.url custom_route_url(custom_route, format: :json)
end
