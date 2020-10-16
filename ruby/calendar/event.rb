require 'date'
require 'time'

class Event
  DELIMITER = ';'.freeze
  attr_reader :name, :date, :start_time, :end_time

  def self.new_from_string_representation(string_representation)
    new(*string_representation.split(DELIMITER))
  end

  def initialize(name, date, start_time, end_time)
    @name = name
    @date = Date.parse(date)
    @start_time = Time.parse(start_time)
    @end_time = Time.parse(end_time)
    raise 'End time is before start time' unless @start_time < @end_time
  end

  def string_representation
    [@name, @date.to_s, format_time(@start_time), format_time(@end_time)]
      .join(DELIMITER)
  end

  def display
    print <<~DATA
      Event: #{@name}
      ↳ Date: #{@date}
      ↳ Time slot: #{format_time(@start_time)} - #{format_time(@end_time)}
    DATA
  end

  def format_time(time)
    time.strftime('%I:%M%p')
  end

  def overlaps?(event2)
    return false if @date != event2.date

    (@start_time < event2.start_time && event2.start_time < @end_time) ||
      (event2.start_time < @start_time && @start_time < event2.end_time)
  end
end
