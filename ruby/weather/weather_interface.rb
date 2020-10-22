require_relative 'api_client'
require_relative 'weather'

class WeatherInterface
  def initialize
    @api_client = APIClient.new
  end

  def run(argv)
    case argv[0]
    when 'current' then display_current(argv[1], argv[2])
    when 'forecast' then display_forecast(argv[1], argv[2])
    else display_usage
    end
  end

  def display_current(location, unit)
    display(@api_client.fetch_current(location, unit_name(unit)))
  end

  def display_forecast(location, unit)
    select_forecast_list(@api_client.fetch_forecast(location, unit_name(unit))).each do |data|
      display(data)
    end
  end

  def unit_name(unit)
    case unit.upcase
    when 'C' then 'metric'
    when 'F' then 'imperial'
    when 'K' then 'standard'
    end
  end

  def select_forecast_list(data)
    data['list']
  end

  def display(data)
    create(data).display
  end

  def create(data)
    Weather.new(
      time: Time.at(data['dt']),
      weather_condition: data['weather'][0]['description'],
      temperature: data['main']['temp']
    )
  end

  def display_usage
    print <<~USAGE
      current <location> <unit>
      Description: Current weather report
      Unit: C / F / K
      eg. current kolkata

      forecast <location> <unit>
      Description: Weather forecast
      Unit: C / F / K
      eg. forecast kolkata
    USAGE
  end
end

if __FILE__ == $0
  weather_interface = WeatherInterface.new
  weather_interface.run(ARGV)
end
