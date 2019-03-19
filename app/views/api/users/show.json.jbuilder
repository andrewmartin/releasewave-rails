json.merge! @release.attributes
json.image do
  json.full @release.image.url(:original)
  json.thumb @release.image.url(:thumb)
  json.square @release.image.url(:square)
  json.large @release.image.url(:large)
end
json.artists do
  json.array! @release.artists do |artist|
    json.merge! artist.attributes
    json.image do
      json.full artist.image.url(:original)
      json.thumb artist.image.url(:thumb)
      json.square artist.image.url(:square)
      json.large artist.image.url(:large)
    end
  end
end
json.embeds do
  json.array! @release.embeds do |embed|
    json.merge! embed.attributes
  end
end