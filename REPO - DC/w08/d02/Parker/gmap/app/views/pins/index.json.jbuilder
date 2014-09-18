json.array!(@pins) do |pin|
  json.extract! pin, :id, :lat, :lng
  json.url pin_url(pin, format: :json)
end
