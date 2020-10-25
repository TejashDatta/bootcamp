require 'open-uri'
require 'json'
require_relative 'weather'

class WeatherAPIClient
  BASE_URL = 'http://api.openweathermap.org/data/2.5/'.freeze

  def initialize
    @api_key = ENV['WEATHER_API_KEY']
  end

  def current(location, units)
    create_weather(fetch_and_parse_weather_of_type('weather', location, units))
  end

  def forecast(location, units, date)
    fetch_and_parse_weather_of_type('forecast', location, units)
      .map { |forecast_entry| create_weather(forecast_entry) }
      .select { |weather| weather.time.to_date == Date.parse(date) }
  end

  private

  def fetch_and_parse_weather_of_type(type, location, units)
    JSON.parse(read_url(build_url(type, location, units)))
  end

  def build_url(type, location, units)
    "#{File.join(BASE_URL, type)}?q=#{location}&APPID=#{@api_key}&units=#{units}"
  end

  def read_url(url)
    URI.open(url).read
  end

  def create_weather(parsed_weather_json)
    Weather.new(
      time: Time.at(parsed_weather_json['dt']),
      weather_condition: parsed_weather_json['weather'][0]['description'],
      temperature: parsed_weather_json['main']['temp']
    )
  end
end
