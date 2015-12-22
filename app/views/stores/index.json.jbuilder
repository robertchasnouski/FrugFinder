json.array!(@stores) do |store|
  json.extract! store, :id, :name, :latitude, :longitude
  json.url store_url(store, format: :json)
end
