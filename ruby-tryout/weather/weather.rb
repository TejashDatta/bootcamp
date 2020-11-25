class Weather
  attr_accessor :time

  def initialize(time:, weather_condition:, temperature:)
    @time = Time.at(time)
    @weather_condition = weather_condition
    @temperature = temperature
  end

  def display
    puts "#{@time}: #{@weather_condition} #{@temperature}"
  end
end
