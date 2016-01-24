json.array!(@shoppinglists) do |shoppinglist|
  json.extract! shoppinglist, :id, :manipulator_type, :total, :time
  json.url shoppinglist_url(shoppinglist, format: :json)
end
