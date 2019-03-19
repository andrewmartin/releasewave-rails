json.merge! @release.attributes
json.image do
  json.full @release.image.url(:original)
  json.thumb @release.image.url(:thumb)
  json.square @release.image.url(:square)
  json.large @release.image.url(:large)
end