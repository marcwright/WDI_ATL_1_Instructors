json.array!(@stuffs) do |stuff|
  json.extract! stuff, :id, :title
  json.url stuff_url(stuff, format: :json)
end
