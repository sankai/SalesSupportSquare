json.array!(@mailtemplates) do |mailtemplate|
  json.extract! mailtemplate, :id, :name, :title, :banner, :content, :trailer
  json.url mailtemplate_url(mailtemplate, format: :json)
end
