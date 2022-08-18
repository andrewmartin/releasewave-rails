require "nokogiri"
require "httparty"
require "json"

headers = {
  "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.19582",
}

params = {
  q: "drug church",
  num: "100",
}

response = HTTParty.get("https://www.google.com/search", query: params, headers: headers)

doc = Nokogiri::HTML(response.body)
puts doc
data = doc.css(".egMi0").map do |result|
  title = result.at_css(".DKV0Md")&.text
  link = result.at_css(".yuRUbf a")&.attr("href")
  displayed_link = result.at_css(".tjvcx")&.text
  snippet = result.at_css(".VwiC3b")&.text
  # puts "#{title}#{snippet}#{link}#{displayed_link}\n\n"

  {
    title: title,
    link: link,
    displayed_link: displayed_link,
    snippet: snippet,
  }.compact
end

puts JSON.pretty_generate(data)

# --------
=begin
[
  {
    "title": "Stack for Stack Overflow - Apps on Google Play",
    "link": "https://play.google.com/store/apps/details?id=me.tylerbwong.stack&hl=en_US&gl=US",
    "displayed_link": "https://play.google.com › store › apps › details",
    "snippet": "Stack is powered by Stack Overflow and other Stack Exchange sites. Search and filter through questions to find the exact answer you're looking for!"
  }
...
]
=end
