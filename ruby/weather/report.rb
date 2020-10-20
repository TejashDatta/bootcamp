require_relative 'time_operations'

class Report
  def initialize(data)
    @city = data['name']
    @country = data['sys']['country']
    @weather_condition = data['weather'][0]['description']
    @temperature = data['main']['temp']
    @time = TimeOperations.format_time(data['dt'])
  end

  def display
    print <<~DATA
      Weather report for #{@city}, #{@country} on #{@time}:
      #{@weather_condition} | #{@temperature}
    DATA
  end
end
