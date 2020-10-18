require 'date'

class Weather
  attr_accessor :data

  def initialize(type:, units:, city:, country:, weather_condition:, temperature:, time:, timezone_offset:)
    @type = type
    @units = units
    @city = city
    @country = country
    @weather_condition = weather_condition
    @temperature = temperature
    @time = time
    @timezone_offset = timezone_offset
  end

  def display
    print <<~DATA
      Weather #{@type} for #{@city}, #{@country} on #{time_string}:
      #{@weather_condition}  |  #{@temperature} #{temperature_unit}
    DATA
  end

  def local_time_in_utc_zone
    Time.at(@time + @timezone_offset).utc
  end

  def time_string
    local_time_in_utc_zone.strftime('%a, %-d %b at %I:%M%P')
  end

  def date_equal?(date_string)
    local_time_in_utc_zone.to_date == Date.parse(date_string)
  end

  def temperature_unit
    case @units
    when 'imperial' then '°F'
    when 'metric' then '°C'
    when 'standard' then 'K'
    end
  end
end
