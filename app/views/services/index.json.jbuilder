json.array!(@services) do |service|
  json.extract! service, :description, :qty, :value, :category_id
  json.url service_url(service, format: :json)
end
