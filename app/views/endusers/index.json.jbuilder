json.array!(@endusers) do |enduser|
  json.extract! enduser, :id, :code, :name
  json.url enduser_url(enduser, format: :json)
end
