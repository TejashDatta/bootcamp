require 'date'

class Weather
  attr_accessor :data

  def initialize(type:, location:, weather_condition:, temperature:, zone_offset:, time:, units:)
    @type = type
    @location = location
    @weather_condition = weather_condition
    @temperature = temperature
    @zone_offset = zone_offset
    @time = time
    @units = units
  end

  def display
    print <<~DATA
      Weather #{@type} for #{@location} on #{time_string}:
      #{@weather_condition}  |  #{@temperature} #{temperature_unit}
    DATA
  end

  def local_time_in_utc_zone
    Time.at(@time + @zone_offset).utc
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
