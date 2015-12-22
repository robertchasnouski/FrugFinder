json.array!(@drugs) do |drug|
  json.extract! drug, :id, :drug_name, :price, :available
  json.url drug_url(drug, format: :json)
end
