json.array!(@route_keys) do |route_key|
  json.extract! route_key, :id, :key, :owner_id, :owner_type, :custom_route_id
  json.url route_key_url(route_key, format: :json)
end
