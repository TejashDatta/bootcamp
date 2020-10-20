require_relative 'forecast_entry'

class Forecast
  def initialize(data)
    @city = data['city']['name']
    @country = data['city']['country']
    @entries = []
    populate_entries(data['list'])
  end

  def populate_entries(entries_data)
    entries_data.each { |entry_data| @entries.push(ForecastEntry.new(entry_data)) }
  end

  def select_for_date!(date_string)
    @entries.select! { |entry| entry.date_equal? date_string }
  end

  def display
    puts "Weather forecast for #{@city}, #{@country}:"
    @entries.each(&:display)
  end
end
