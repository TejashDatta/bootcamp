require 'date'
require 'time'
require_relative 'weather_api'
require_relative 'file_management'

class WeatherDisplayer
  DEFAULT_UNITS = 'metric'.freeze

  def initialize
    @weather_api = WeatherAPI.new
    @default_location = FileManagement.read_default_location
  end

  def run(argv)
    command = argv[0]
    options = parse_options(argv[1..-1])
    case command
    when 'set-location' then save_location(argv[1])
    when 'report' then display_report(**options)
    when 'forecast' then display_forecast(**options)
    else display_usage
    end
  end

  def save_location(location)
    FileManagement.write_default_location(location)
  end

  def check_location_is_set(location)
    raise 'Please set a default location or provide it as an option' if location.nil?
  end

  def display_report(location: @default_location, units: DEFAULT_UNITS)
    check_location_is_set(location)

    data = @weather_api.fetch_report(location, units)
    city = data['name']
    country = data['sys']['country']
    weather_condition = data['weather'][0]['description']
    temperature = data['main']['temp']
    time = format_time(data['dt'])

    print <<~DATA
      Weather report for #{city}, #{country} on #{time}:
      #{weather_condition} | #{temperature}
    DATA
  end

  def display_forecast(location: @default_location, units: DEFAULT_UNITS, date: nil)
    check_location_is_set(location)

    data = @weather_api.fetch_forecast(location, units)
    city = data['city']['name']
    country = data['city']['country']
    puts "Weather forecast for #{city}, #{country}:"

    forecast_entries = if date.nil?
                         data['list']
                       else
                         select_forecast_entries_for_date(data['list'], date)
                       end

    display_forecast_entries(forecast_entries)
  end

  def format_time(time)
    Time.at(time).utc.strftime('%a, %-d %b at %H:%M (UTC)')
  end

  def select_forecast_entries_for_date(entries, date_string)
    entries.select do |entry|
      Time.at(entry['dt']).to_date == Date.parse(date_string)
    end
  end

  def display_forecast_entries(entries)
    entries.each do |entry|
      weather_condition = entry['weather'][0]['description']
      temperature = entry['main']['temp']
      time = format_time(entry['dt'])
      puts "#{time}: #{weather_condition} | #{temperature}"
    end
  end

  private

  def parse_options(options_array)
    options = {}
    options_array.each do |string|
      option, value = string.split('=')
      options[option.to_sym] = value
    end
    options
  end
end

if __FILE__ == $PROGRAM_NAME
  weather_displayer = WeatherDisplayer.new
  weather_displayer.run(ARGV)
end
