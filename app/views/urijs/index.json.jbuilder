json.array!(@urijs) do |urij|
  json.extract! urij, :id, :year, :month, :amount, :anken_id
  json.url urij_url(urij, format: :json)
end
