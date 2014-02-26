json.array!(@bmns) do |bmn|
  json.extract! bmn, :id, :code, :name
  json.url bmn_url(bmn, format: :json)
end
