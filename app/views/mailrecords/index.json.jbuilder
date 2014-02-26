json.array!(@mailrecords) do |mailrecord|
  json.extract! mailrecord, :id, :shain_id, :mailsent_id
  json.url mailrecord_url(mailrecord, format: :json)
end
