json.array!(@films) do |film|
  json.extract! film, :id, :attribute
  json.url film_url(film, format: :json)
end
