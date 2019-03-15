json.merge! @artist.attributes
json.image do
  json.full @artist.image.url(:original)
  json.thumb @artist.image.url(:thumb)
  json.square @artist.image.url(:square)
  json.large @artist.image.url(:large)
end