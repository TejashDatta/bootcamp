require_relative 'weather_api_client'
require_relative 'file_management'

class WeatherDisplayer
  def initialize
    @api_client = WeatherAPIClient.new
  end

  def run(argv)
    case argv[0]
    when 'set-default' then set_default_location(argv[1])
    when 'current' then display_current(argv[1], argv[2])
    when 'default-current' then display_default_current(argv[1])
    when 'forecast' then display_forecast(argv[1], argv[2], argv[3])
    when 'default-forecast' then display_default_forecast(argv[1], argv[2])
    else display_usage
    end
  end

  def set_default_location(location)
    FileManagement.write_default_location(location)
  end

  def get_default_location
    FileManagement.read_default_location
  end

  def display_current(location, unit)
    @api_client.fetch_current(location, unit_name(unit)).display
  end

  def display_forecast(location, unit, date)
    @api_client.fetch_forecast(location, unit_name(unit), date).each(&:display)
  end

  def display_default_current(unit)
    display_current(get_default_location, unit)
  end

  def display_default_forecast(unit, date)
    display_forecast(get_default_location, unit, date)
  end

  def unit_name(unit)
    case unit.upcase
    when 'C' then 'metric'
    when 'F' then 'imperial'
    when 'K' then 'standard'
    end
  end

  def display_usage
    print <<~USAGE
      set-default <location>
      Description: Set default language

      current <location> <unit>
      Description: Current weather report
      Unit: C / F / K

      default-current <unit>
      Description: Current weather report for default location
      Unit: C / F / K

      forecast <location> <unit> <date>
      Description: Weather forecast
      Unit: C / F / K
      Date: A date within next 5 days

      default-forecast <unit> <date>
      Description: Weather forecast for default location
      Unit: C / F / K
      Date: A date within next 5 days
    USAGE
  end
end

if __FILE__ == $0
  weather_displayer = WeatherDisplayer.new
  weather_displayer.run(ARGV)
end
