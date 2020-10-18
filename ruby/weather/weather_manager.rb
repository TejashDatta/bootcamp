require_relative 'weather_api'
require_relative 'weather'
require_relative 'file_management'

class WeatherManager
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
    when 'report' then report(**options)
    when 'forecast' then forecast(**options)
    else display_usage
    end
  end

  def save_location(location)
    FileManagement.write_default_location(location)
  end

  def check_location_is_set(location)
    raise 'Please set a default location or provide it as an option' if location.nil?
  end

  def report(location: @default_location, units: DEFAULT_UNITS)
    check_location_is_set(location)

    report_data = @weather_api.fetch_report(location, units)
    report_data['units'] = units
    report = create_report(report_data)
    report.display
  end

  def forecast(location: @default_location, units: DEFAULT_UNITS, date: nil)
    check_location_is_set(location)

    forecast_data = @weather_api.fetch_forecast(location, units)
    forecast_data['units'] = units
    forecasts = create_forecasts(forecast_data)
    if date.nil?
      display_forecasts(forecasts)
    else
      display_forecasts(forecasts_on_date(forecasts, date))
    end
  end

  def create_report(data)
    Weather.new(
      type: 'report',
      units: data['units'],
      city: data['name'],
      country: data['sys']['country'],
      weather_condition: data['weather'][0]['description'],
      temperature: data['main']['temp'],
      time: data['dt'],
      timezone_offset: data['timezone']
    )
  end

  def create_forecasts(data)
    forecasts = []
    data['list'].each do |entry|
      forecasts.push(
        Weather.new(
          type: 'forecast',
          units: data['units'],
          city: data['city']['name'],
          country: data['city']['country'],
          weather_condition: entry['weather'][0]['description'],
          temperature: entry['main']['temp'],
          time: entry['dt'],
          timezone_offset: data['city']['timezone']
        )
      )
    end
    forecasts
  end

  def display_forecasts(forecasts)
    forecasts.each(&:display)
  end

  def forecasts_on_date(forecasts, date_string)
    forecasts.select { |forecast| forecast.date_equal? date_string }
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
      date = <dd/mm/yyyy / yyyy.mm.dd /etc. format> Limits forecast to one date
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
  weather_manager = WeatherManager.new
  weather_manager.run(ARGV)
end
