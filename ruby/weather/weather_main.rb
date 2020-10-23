require_relative 'weather_api_client'
require_relative 'weather'
require_relative 'file_management'

class WeatherMain
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
    display(@api_client.fetch_current(location, unit_name(unit)))
  end

  def display_forecast(location, unit, date)
    select_entries_for_date(
      @api_client.fetch_forecast(location, unit_name(unit)),
      date
    ).each { |weather_json| display(weather_json) }
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

  def select_entries_for_date(forecast_json, date)
    forecast_json['list'].select do |weather_json|
      Time.at(weather_json['dt']).to_date == Date.parse(date)
    end
  end

  def display(weather_json)
    create(weather_json).display
  end

  def create(weather_json)
    Weather.new(
      time: Time.at(weather_json['dt']),
      weather_condition: weather_json['weather'][0]['description'],
      temperature: weather_json['main']['temp']
    )
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
  weather_main = WeatherMain.new
  weather_main.run(ARGV)
end
