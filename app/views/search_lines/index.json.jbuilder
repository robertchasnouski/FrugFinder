json.array!(@search_lines) do |search_line|
  json.extract! search_line, :id, :name, :user_name
  json.url search_line_url(search_line, format: :json)
end
