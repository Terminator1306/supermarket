json.array!(@items) do |item|
  json.extract! item, :id, :product_id, :quantity
  json.url item_url(item, format: :json)
end
