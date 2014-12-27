json.array!(@groups) do |group|
  json.extract! group, :id, :owner_id, :name, :owner_type
  json.url group_url(group, format: :json)
end
