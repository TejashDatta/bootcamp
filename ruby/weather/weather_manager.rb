require_relative 'weather_api'
require_relative 'weather'

class WeatherManager
  DEFAULT_UNITS = 'metric'.freeze

  def initialize
    @weather_api = WeatherAPI.new
  end

  def run(argv)
    command, options, location = argv[0], parse_options(argv[1..-2]), argv[-1]
    case command
    when 'report' then report(location, **options)
    when 'forecast' then forecast(location, **options)
    else display_usage
    end
  end

  def report(location, units: DEFAULT_UNITS)
    report_data = @weather_api.fetch_report(location, units)
    report_data['units'] = units
    report = create_report(report_data)
    report.display
  end

  def forecast(location, units: DEFAULT_UNITS, date: nil)
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
      location: "#{data['name']}, #{data['sys']['country']}",
      weather_condition: data['weather'][0]['description'],
      temperature: data['main']['temp'],
      zone_offset: data['timezone'],
      time: data['dt']
    )
  end

  def create_forecasts(data)
    forecasts = []
    data['list'].each do |entry|
      forecasts.push(
        Weather.new(
          type: 'forecast',
          units: data['units'],
          location: "#{data['city']['name']}, #{data['city']['country']}",
          weather_condition: entry['weather'][0]['description'],
          temperature: entry['main']['temp'],
          zone_offset: data['city']['timezone'],
          time: entry['dt']
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

      report <options> <location>
      Description: Shows the current weather condition
      Available options:
      units = metric (default) / imperial / standard
      eg. report units=imperial kolkata

      forecast <options> <location>
      Description: Shows the weather forecast of the next 5 days
      Available options:
      units = metric (default) / imperial / standard
      date = dd/mm/yyyy or yyyy.mm.dd format (limits forecast to one date)
      eg. forecast date=22.10.2020 tokyo
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
