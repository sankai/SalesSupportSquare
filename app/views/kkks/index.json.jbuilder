json.array!(@kkks) do |kkk|
  json.extract! kkk, :id, :code, :name
  json.url kkk_url(kkk, format: :json)
end
