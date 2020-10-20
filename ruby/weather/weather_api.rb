require 'net/http'
require 'json'

class WeatherAPI
  REPORT_ENDPOINT = 'http://api.openweathermap.org/data/2.5/weather'.freeze
  FORECAST_ENDPOINT = 'http://api.openweathermap.org/data/2.5/forecast'.freeze

  def initialize
    @api_key = ENV['WEATHER_API_KEY']
  end

  def fetch_report(location, units)
    fetch(REPORT_ENDPOINT, location, units)
  end

  def fetch_forecast(location, units)
    fetch(FORECAST_ENDPOINT, location, units)
  end

  private

  def fetch(endpoint, location, units)
    query = "q=#{location}&APPID=#{@api_key}&units=#{units}"
    uri = "#{endpoint}?#{query}"
    response = Net::HTTP.get_response(URI(uri))
    raise 'Retrieval failed' unless response.code == '200'

    JSON.parse(response.body)
  end
end
