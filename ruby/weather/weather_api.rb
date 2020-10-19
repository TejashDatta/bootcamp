require 'net/http'
require 'json'

class WeatherAPI
  def initialize
    @api_key = ENV['WEATHER_API_KEY']
  end

  def fetch_report(location, units)
    endpoint = "http://api.openweathermap.org/data/2.5/weather?q=#{location}&APPID=#{@api_key}&units=#{units}"
    fetch(endpoint)
  end

  def fetch_forecast(location, units)
    endpoint = "http://api.openweathermap.org/data/2.5/forecast?q=#{location}&APPID=#{@api_key}&units=#{units}"
    fetch(endpoint)
  end

  private

  def fetch(endpoint)
    response = Net::HTTP.get_response(URI(endpoint))
    raise 'Retrieval failed' unless response.code == '200'

    JSON.parse(response.body)
  end
end
