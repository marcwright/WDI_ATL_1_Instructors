json.array!(@pastries) do |pastry|
  json.extract! pastry, :id, :name, :dept, :price
  json.url pastry_url(pastry, format: :json)
end
