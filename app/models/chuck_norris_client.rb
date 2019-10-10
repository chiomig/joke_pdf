class ChuckNorrisClient

  class << self
    def chucks_no_joke
      uri = URI.parse("https://api.chucknorris.io/jokes/random?category=#{be_nice_chuck}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl= true

      request = Net::HTTP::Get.new(uri.request_uri)

      resp = http.request(request)
      JSON.parse(resp.body)
    end

    def be_nice_chuck
      ["animal","career","celebrity","dev",
       "fashion","food","history","money",
       "movie","music","political","religion",
       "science","sport","travel"].sample
    end
  end

end
