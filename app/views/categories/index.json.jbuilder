json.array!(@categories) do |category|
  json.extract! category, :id, :tag
  json.url category_url(category, format: :json)
end
