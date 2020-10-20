require_relative 'weather_api'
require_relative 'file_management'
require_relative 'report'
require_relative 'forecast'

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
    report = Report.new(data)
    report.display
  end

  def display_forecast(location: @default_location, units: DEFAULT_UNITS, date: nil)
    check_location_is_set(location)

    data = @weather_api.fetch_forecast(location, units)
    forecast = Forecast.new(data)
    forecast.select_for_date!(date) unless date.nil?
    forecast.display
  end

  def display_usage
    print <<~USAGE
      Available commands:

      set-location <location>
      Description: Sets and saves the default location
      eg. set-location tokyo

      report <options>
      Description: Shows the current weather condition for the default location
      
        Available options:
        location = Overrides default location
        units = metric (default) / imperial / standard
        
      eg. report units=imperial location='san francisco'

      forecast <options>
      Description: Shows the weather forecast of the next 5 days for the default location
      
        Available options:
        location = Overrides default location
        units = <metric (default) / imperial / standard>
        date = <dd/mm/yyyy / yyyy.mm.dd /etc. format (in UTC)> Limits forecast to one date

      eg. forecast date=22.10.2020
    USAGE
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
