require 'time'
require 'date'

module TimeOperations
  module_function

  def format_time(unix_time)
    Time.at(unix_time).utc.strftime('%a, %-d %b at %H:%M (UTC)')
  end

  def date_equal?(time_string, date_string)
    Time.parse(time_string).to_date == Date.parse(date_string)
  end
end
