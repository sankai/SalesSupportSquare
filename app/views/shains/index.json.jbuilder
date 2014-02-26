json.array!(@shains) do |shain|
  json.extract! shain, :id, :code, :name
  json.url shain_url(shain, format: :json)
end
