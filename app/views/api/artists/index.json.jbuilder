json.per_page @artists.per_page
json.total_entries @artists.total_entries
json.current_page @artists.current_page
json.items do
  json.array! @artists do |artist|
    json.merge! artist.attributes
    json.image do
      json.full artist.image.url(:original)
      json.thumb artist.image.url(:thumb)
      json.square artist.image.url(:square)
      json.large artist.image.url(:large)
    end
  end
end
