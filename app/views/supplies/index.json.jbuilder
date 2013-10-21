json.array!(@supplies) do |supply|
  json.extract! supply, :description, :unit, :qty, :value, :category_id
  json.url supply_url(supply, format: :json)
end
