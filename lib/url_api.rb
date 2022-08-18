require "httparty"
require "json"

class UrlApi
  def get(query = "")
    headers = {
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.19582",
    }

    queryString = "#{query}"

    @response = HTTParty.get("https://customsearch.googleapis.com/customsearch/v1?q=#{queryString}&key=#{ENV.fetch("GOOGLE_SEARCH_API_KEY")}&cx=#{ENV.fetch("GOOGLE_SEARCH_CX")}", headers: headers)

    @response
  end
end
