require_relative 'weather_api'
require_relative 'weather_data'

class WeatherInterface
  def initialize
    @weather_api = WeatherAPI.new
  end

  def run(argv)
    case argv[0]
    when 'current' then display_current(argv[1])
    when 'forecast' then display_forecast(argv[1])
    else display_usage
    end
  end

  def display_current(location)
    display(@weather_api.fetch_current(location))
  end

  def display_forecast(location)
    select_data_list(@weather_api.fetch_forecast(location)).each do |data|
      display(data)
    end
  end

  def select_forecast_list(data)
    data['list']
  end

  def display(data)
    create(data).display
  end

  def create(data)
    WeatherData.new(
      time: Time.at(data['dt']),
      weather_condition: data['weather'][0]['description'],
      temperature: data['main']['temp']
    )
  end

  def display_usage
    print <<~USAGE
      current <location>
      Description: Current weather report
      eg. current kolkata

      forecast <location>
      Description: Weather forecast
      eg. forecast kolkata
    USAGE
  end
end

if __FILE__ == $0
  weather_interface = WeatherInterface.new
  weather_interface.run(ARGV)
end
