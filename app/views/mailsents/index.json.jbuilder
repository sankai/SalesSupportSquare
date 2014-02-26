json.array!(@mailsents) do |mailsent|
  json.extract! mailsent, :id, :mailtemplate_id, :sent_time
  json.url mailsent_url(mailsent, format: :json)
end
