xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Release Wave"
    xml.description "Discover the best curated new music releases"
    xml.link 'https://releasewave.com'
    xml.category 'Music'

    @releases.each do |release|
      xml.item do
        xml.title release.name
        xml.tag!("description") { xml.cdata!(release.description) }
        xml.pubDate release.created_at.to_s(:rfc822)
        xml.link  "https://releasewave.com/releases/#{release.slug}"
        xml.guid  "https://releasewave.com/releases/#{release.slug}"
        if release.image.file?
          xml.image do
            xml.url "https:#{release.image}"
            xml.title release.name
            xml.link "https://releasewave.com/releases/#{release.slug}"
          end
        end
      end
    end
  end
end