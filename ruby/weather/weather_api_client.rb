require 'open-uri'
require 'json'
require_relative 'weather'

class WeatherAPIClient
  BASE_URL = 'http://api.openweathermap.org/data/2.5/'.freeze

  def initialize
    @api_key = ENV['WEATHER_API_KEY']
  end

  def weather_current(location, units)
    create_weather(parse_current(fetch_weather_json('weather', location, units)))
  end

  def weather_forecasts(location, units, date)
    parse_forecast(fetch_weather_json('forecast', location, units))
      .map { |forecast_entry| create_weather(forecast_entry) }
      .select { |weather| weather.time.to_date == Date.parse(date) }
  end

  private

  def parse_current(json)
    JSON.parse(json)
  end

  def parse_forecast(json)
    JSON.parse(json)['list']
  end

  def fetch_weather_json(type, location, units)
    URI.open(File.join(BASE_URL, query(type, location, units))).read
  end

  def query(type, location, units)
    "#{type}/?q=#{location}&APPID=#{@api_key}&units=#{units}"
  end

  def create_weather(parsed_weather_json)
    Weather.new(
      time: Time.at(parsed_weather_json['dt']),
      weather_condition: parsed_weather_json['weather'][0]['description'],
      temperature: parsed_weather_json['main']['temp']
    )
  end
end
