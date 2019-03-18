json.per_page @releases.per_page
json.total_entries @releases.total_entries
json.current_page @releases.current_page
json.items do
  json.array! @releases do |item|
    json.merge! item.attributes
    json.image do
      json.full item.image.url(:original)
      json.thumb item.image.url(:thumb)
      json.square item.image.url(:square)
      json.large item.image.url(:large)
    end
    json.artists do
      json.array! item.artists
    end
  end
end
