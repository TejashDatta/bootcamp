require 'open-uri'
require 'json'

class WeatherAPI
  CURRENT_BASE_URL = 'http://api.openweathermap.org/data/2.5/weather'.freeze
  FORECAST_BASE_URL = 'http://api.openweathermap.org/data/2.5/forecast'.freeze
  UNITS = 'metric'.freeze

  def initialize
    @api_key = ENV['WEATHER_API_KEY']
  end

  def fetch_current(location)
    fetch(build_url(CURRENT_BASE_URL, location))
  end

  def fetch_forecast(location)
    fetch(build_url(FORECAST_BASE_URL, location))
  end

  private

  def build_url(base_url, location)
    "#{base_url}?q=#{location}&APPID=#{@api_key}&units=#{UNITS}"
  end

  def fetch(url)
    JSON.parse(URI.open(url).read)
  end
end
