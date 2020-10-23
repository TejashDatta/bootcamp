require 'open-uri'
require 'json'
require_relative 'weather'

class WeatherAPIClient
  BASE_URL = 'http://api.openweathermap.org/data/2.5/'.freeze

  def initialize
    @api_key = ENV['WEATHER_API_KEY']
  end

  def fetch_current(location, units)
    create_weather(fetch_hash('weather', location, units))
  end

  def fetch_forecast(location, units, date)
    forecast_array = []
    select_forecast_entries_for_date(
      fetch_hash('forecast', location, units),
      date
    ).each { |weather_hash| forecast_array << create_weather(weather_hash) }
    forecast_array
  end

  private

  def fetch_hash(type, location, units)
    JSON.parse(read_url(build_url(type, location, units)))
  end

  def build_url(type, location, units)
    "#{File.join(BASE_URL, type)}?q=#{location}&APPID=#{@api_key}&units=#{units}"
  end

  def read_url(url)
    URI.open(url).read
  end

  def create_weather(weather_hash)
    Weather.new(
      time: Time.at(weather_hash['dt']),
      weather_condition: weather_hash['weather'][0]['description'],
      temperature: weather_hash['main']['temp']
    )
  end

  def select_forecast_entries_for_date(forecast_hash, date)
    forecast_hash['list'].select do |weather_hash|
      Time.at(weather_hash['dt']).to_date == Date.parse(date)
    end
  end
end
