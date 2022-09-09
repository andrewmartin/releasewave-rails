json.releases do
  json.per_page @releases.per_page
  json.total_entries @releases.total_entries
  json.current_page @releases.current_page
  json.items do
    json.array! @releases do |item|
        json.merge! item.attributes
        json.short_description item.short_description

        json.image do
        json.full item.image.url(:original)
        json.thumb item.image.url(:thumb)
        json.square item.image.url(:square)
        json.large item.image.url(:large)
        end

        json.artists do
        json.array! item.artists do |artist|
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
        json.array! item.embeds do |embed|
            json.merge! embed.attributes
        end
        end
    end
  end
end
json.artists do
  json.per_page @artists.per_page
  json.total_entries @artists.total_entries
  json.current_page @artists.current_page
  json.items do
    json.array! @artists do |item|
      json.merge! item.attributes
      json.short_description item.short_description

      json.image do
        json.full item.image.url(:original)
        json.thumb item.image.url(:thumb)
        json.square item.image.url(:square)
        json.large item.image.url(:large)
      end
    end
  end
end
