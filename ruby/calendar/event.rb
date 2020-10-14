require_relative 'config'

class Event
  attr_reader :name
  attr_accessor :date

  def initialize(event_name)
    @name = event_name
    @file_path = File.join(Config.data_directory_path, @name)
  end

  def read_from_file
    File.open(@file_path, 'r') do |event_file|
      @date = event_file.gets.chomp
    end
  end

  def save_to_file
    File.open(@file_path, 'w') do |event_file|
      event_file.puts(@date)
    end
  end

  def delete_file
    File.delete(@file_path)
  end

  def display_details
    puts %(Event name: "#{@name}" on date: #{@date})
  end
end
