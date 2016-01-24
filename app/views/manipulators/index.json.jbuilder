json.array!(@manipulators) do |manipulator|
  json.extract! manipulator, :id, :m_name, :password, :m_type
  json.url manipulator_url(manipulator, format: :json)
end
