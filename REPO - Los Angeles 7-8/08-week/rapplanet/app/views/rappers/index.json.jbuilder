json.array!(@rappers) do |rapper|
  json.extract! rapper, :id, :name, :age
  json.url rapper_url(rapper, format: :json)
end
