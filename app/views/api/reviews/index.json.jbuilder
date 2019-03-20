json.per_page @reviews.per_page
json.total_entries @reviews.total_entries
json.current_page @reviews.current_page
json.items do
  json.array! @reviews do |item|
    json.merge! item.attributes
    json.user do
      json.id item.user.id
      json.image item.user.image.url(:large)
      json.email item.user.email
      json.name item.user.name
    end
  end
end
