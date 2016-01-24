json.array!(@products) do |product|
  json.extract! product, :id, :p_name, :description, :price, :quantity
  json.url product_url(product, format: :json)
end
