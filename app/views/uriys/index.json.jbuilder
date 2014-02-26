json.array!(@uriys) do |uriy|
  json.extract! uriy, :id, :year, :month, :amount, :anken_id
  json.url uriy_url(uriy, format: :json)
end
