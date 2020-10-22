require 'open-uri'
require 'json'

class APIClient
  BASE_URL = 'http://api.openweathermap.org/data/2.5/'.freeze

  def initialize
    @api_key = ENV['WEATHER_API_KEY']
  end

  def fetch_current(location, units)
    fetch('weather', location, units)
  end

  def fetch_forecast(location, units)
    fetch('forecast', location, units)
  end

  private

  def fetch(type, location, units)
    JSON.parse(read_url(build_url(type, location, units)))
  end

  def build_url(type, location, units)
    "#{File.join(BASE_URL, type)}?q=#{location}&APPID=#{@api_key}&units=#{units}"
  end

  def read_url(url)
    URI.open(url).read
  end
end
