json.per_page @media.per_page
json.total_entries @media.total_entries
json.current_page @media.current_page
json.size @media.size
json.items do
  json.array! @media do |item|
    json.url url_for(item.image)
    json.created_at item.created_at
    json.updated_at item.updated_at
    json.width item.width
    json.height item.height
    json.caption item.caption
    json.id item.id
  end
end
