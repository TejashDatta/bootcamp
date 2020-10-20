require_relative 'time_operations'

class ForecastEntry
  def initialize(data)
    @weather_condition = data['weather'][0]['description']
    @temperature = data['main']['temp']
    @time = TimeOperations.format_time(data['dt'])
  end

  def date_equal?(date_string)
    TimeOperations.date_equal?(@time, date_string)
  end

  def display
    puts "#{@time}: #{@weather_condition} | #{@temperature}"
  end
end
