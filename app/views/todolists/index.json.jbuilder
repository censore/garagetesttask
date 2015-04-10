json.array!(@todolists) do |list|
  json.extract! list, :id, :title
  json.url todolists_url(list, format: :json)
end