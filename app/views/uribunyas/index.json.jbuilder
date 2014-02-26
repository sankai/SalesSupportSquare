json.array!(@uribunyas) do |uribunya|
  json.extract! uribunya, :id, :code, :name
  json.url uribunya_url(uribunya, format: :json)
end
