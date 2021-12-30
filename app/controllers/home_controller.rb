class HomeController < ApplicationController

  def index
  end

  def about
    @about_me = "My Name is John Elder..."
    @more = "More information..."

    uri = URI('https://api.weather.gov/points/39.7456,-97.0892')
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      @httpBody = JSON.parse(res.body.strip)
    end

    response = HTTParty.get('https://api.weather.gov/points/39.7456,-97.0892')
    if response.code == 200
      @httpartyBody = JSON.parse(response.body.strip)
    end

    @hello = " Hello World "
    @hello2 = response.body.strip

  end

end
