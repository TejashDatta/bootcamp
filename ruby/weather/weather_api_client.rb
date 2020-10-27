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
    parse_forecasts(fetch_weather_json('forecast', location, units))
      .map { |forecast_parsed_json| create_weather(forecast_parsed_json) }
      .select { |weather| weather.time.to_date == Date.parse(date) }
  end

  private

  def parse_current(json)
    JSON.parse(json)
  end

  def parse_forecasts(json)
    JSON.parse(json)['list']
  end

  def fetch_weather_json(type, location, units)
    URI.open(File.join(BASE_URL, query(type, location, units))).read
  end

  def query(type, location, units)
    "#{type}/?q=#{location}&APPID=#{@api_key}&units=#{units}"
  end

  def create_weather(weather_parsed_json)
    Weather.new(
      time: Time.at(weather_parsed_json['dt']),
      weather_condition: weather_parsed_json['weather'][0]['description'],
      temperature: weather_parsed_json['main']['temp']
    )
  end
end
